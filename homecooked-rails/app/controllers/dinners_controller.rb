class DinnersController < ApplicationController
  before_action :require_token

  # get all dinners the user is hosting or attending
  def index
    puts "user: #{@current_user.json_hash[:id]}"
    hosted_dinners = []
    attended_dinners = []
    @hosted_dinners = @current_user.hosted_dinners.each do |dinner|
      hosted_dinners << dinner.all_info
    end
    @attended_dinners = @current_user.attended_dinners.each do |dinner|
      attended_dinners << dinner.all_info
    end
    render json: {
      hosting: hosted_dinners,
      attending: attended_dinners
    }
  end

  # get all dinners the user is hosting
  def index_hosting
    puts "user: #{@current_user.json_hash[:id]}"
    dinners = []
    @dinners = @current_user.hosted_dinners
    @dinners.each do |dinner|
      dinners << dinner.all_info
    end
    render json: dinners
  end

  # get all dinners the user is attending
  def index_attending
    puts "user: #{@current_user.json_hash[:id]}"
    dinners = []
    @dinners = @current_user.attended_dinners
    @dinners.each do |dinner|
      dinners << dinner.all_info
    end
    render json: dinners
  end

  # get all dinners the user has been invited to
  def index_invites
    puts "user: #{@current_user.json_hash[:id]}"
    dinners = []
    @dinners = @current_user.invited_dinners
    @dinners.each do |dinner|
      dinners << dinner.all_info
    end
    render json: dinners
  end

  # get a single dinner
  def show
    puts "user: #{@current_user.json_hash[:id]}"
    @dinner = @current_user.hosted_dinners.find_by(id: params[:id])
    @dinner ||= @current_user.attended_dinners.find_by(id: params[:id])
    @dinner ||= @current_user.invited_dinners.find_by(id: params[:id])
    if @dinner
      render :json => @dinner.all_info
    end
  end

  # add a new dinner
  def create
    @dinner = Dinner.new(dinner_params)
    @dinner.host_id = @current_user.json_hash[:id]
    if @dinner.valid?
      @dinner.save
      render json: @dinner.all_info
    else
      puts @dinner.errors.messages.inspect
      render status: :bad_request, json:       {
        errors: @dinner.errors.messages
      }
    end
  end

  # update a dinner
  def update
    @dinner = Dinner.find(params[:id])
    @dinner.update(dinner_params)
    render :json => @dinner.all_info
  end

  # invite another user to a dinner
  def invite
    @invite = Invite.new
    @invite.invited_id = params[:invited_id]
    @invite.dinner_id = params[:id]
    if @invite.valid?
      @invite.save
      render json: @invite
    else
      puts @invite.errors.messages.inspect
      render status: :bad_request, json:       {
        errors: @invite.errors.messages
      }
    end
  end

  # accept an invite the user has recieved
  def accept
    @invite = Invite.find_by(dinner_id: params[:id], invited_id: @current_user.json_hash[:id])
    if @invite
      @acceptance = AttendeeDinner.new
      @acceptance.dinner_id = @invite.dinner_id
      @acceptance.attendee_id = @invite.invited_id
      if @acceptance.valid?
        @acceptance.save
        @invite.delete
        render json: @acceptance
      else
        puts @acceptance.errors.messages.inspect
        render status: :bad_request, json:       {
          errors: @acceptance.errors.messages
        }
      end
    end
  end

  # remove a user from a dinner
  def remove_attendee
    @attendee = Dinner.find(params[:id]).attendee_dinners.find_by(attendee_id: params[:user_id])
    @attendee.delete
    render json: { message: 'user removed from dinner' }
  end

  # remove an invited but uncomfirmed user from a dinner
  def remove_invite
    @invited = Dinner.find(params[:id]).invites.find_by(invited_id: params[:user_id])
    @invited.delete
    render json: { message: 'user uninvited' }
  end

  # delete a dinner
  def delete
    @dinner = Dinner.find(params[:id])
    @dinner.delete
    render json: { message: 'dinner deleted' }
  end

  private

  def dinner_params
    params.permit(:starts_at, :location)
  end
end
