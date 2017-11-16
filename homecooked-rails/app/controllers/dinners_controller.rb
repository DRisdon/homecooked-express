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
    @dinner = @current_user.hosted_dinners.find(params[:id])
    unless @dinner
      @dinner = @current_user.attended_dinners.find(params[:id])
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

  private

  def dinner_params
    params.permit(:starts_at, :location)
  end

end
