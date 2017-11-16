class DinnersController < ApplicationController

  before_action :require_token

  def index
    puts "user: #{@current_user.json_hash[:id]}"
    @hosted_dinners = @current_user.hosted_dinners
    @attended_dinners = @current_user.attended_dinners
    render :json => {
      :hosting => @hosted_dinners,
      :atending => @attended_dinners
    }
  end

  def index_hosting
    puts "user: #{@current_user.json_hash[:id]}"
    @dinners = @current_user.hosted_dinners
    render :json => @dinners
  end

  def index_attending
    puts "user: #{@current_user.json_hash[:id]}"
    @dinners = @current_user.attended_dinners
    render :json => @dinners
  end

  def show
    puts "user: #{@current_user.json_hash[:id]}"
    @dinner = @current_user.hosted_dinners.find_by(:id => params[:id])
    unless @dinner
      @dinner = @current_user.attended_dinners.find_by(:id => params[:id])
    end
    unless @dinner
      @dinner = @current_user.invited_dinners.find_by(:id => params[:id])
    end
    puts @dinner
    @attendees = @dinner.attendees
    @invited = @dinner.invited
    @host = @dinner.host
    render :json => {
      :info => @dinner,
      :host => {
        :id => @host.id,
        :name => @host.name,
        :email => @host.email,
        :avatar => @host.avatar
      },
      :attendees => @attendees.select(:id, :name, :email, :avatar),
      :invited => @invited.select(:id, :name, :email, :avatar)
    }
  end

  def create
    @dinner = Dinner.new(dinner_params)
    @dinner.host_id = @current_user.json_hash[:id]
    if @dinner.valid?
      @dinner.save
      render :json => @dinner
    else
      puts @dinner.errors.messages.inspect()
      render status: :bad_request, :json =>
      {
        :errors => @dinner.errors.messages
      }
    end
  end

  def invite
    @invite = Invite.new()
    @invite.invited_id = params[:invited_id]
    @invite.dinner_id = params[:id]
    if @invite.valid?
      @invite.save
      render :json => @invite
    else
      puts @invite.errors.messages.inspect()
      render status: :bad_request, :json =>
      {
        :errors => @invite.errors.messages
      }
    end
  end

  def accept
    @invite = Invite.find_by(:dinner_id => params[:id], :invited_id => @current_user.json_hash[:id])
    @acceptance = AttendeeDinner.new()
    @acceptance.dinner_id = @invite.dinner_id
    @acceptance.attendee_id = @invite.invited_id
    if @acceptance.valid?
      @acceptance.save
      @invite.delete
      render :json => @acceptance
    else
      puts @acceptance.errors.messages.inspect()
      render status: :bad_request, :json =>
      {
        :errors => @acceptance.errors.messages
      }
    end
  end

  private

  def dinner_params
    params.permit(:starts_at, :location)
  end

end
