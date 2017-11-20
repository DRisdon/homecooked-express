class UsersController < ApplicationController

  before_action :require_token, only: [:validate]

  def validate
    render :json => @current_user.json_hash
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save()
      render :json => @user.json_hash
    else
      puts @user.errors.messages.inspect()
      render status: :bad_request, :json =>
      {
        :errors => @user.errors.messages
      }
    end
  end

  def index_user
    puts "user: #{User.find(params[:id]).json_hash[:id]}"
    hosted_dinners = []
    attended_dinners = []
    @user = User.find(params[:id])
    @hosted_dinners = @user.hosted_dinners.each do |dinner|
      hosted_dinners << dinner.all_info
    end
    @attended_dinners = @user.attended_dinners.each do |dinner|
      attended_dinners << dinner.all_info
    end
    render json: {
      user: @user.json_hash,
      hosting: hosted_dinners,
      attending: attended_dinners
    }
  end

  def search
    users = User.where('name LIKE ? OR name LIKE ? OR name LIKE ?', "%#{params[:query]}%", "%#{params[:query].split(/(\W)/).map(&:capitalize).join}%", "%#{params[:query].downcase}%").limit(5)
    @users = users.map { |user| user.json_hash_no_token }
    render :json => @users
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end

end
