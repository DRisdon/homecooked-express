class SessionsController < ApplicationController

  def create
	  @user = User.find_by_email(params[:email].downcase)
	  if @user
      puts "email correct!"
      if @user.authenticate(params[:password])
        puts "password correct!"
        @user.regenerate_auth_token
	       render :json => @user.json_hash
      else
        render status: :unauthorized, :json => {
          :password => ["Incorrect Password"]
        }
      end
	  else
      render status: :unauthorized, :json => {
        :email => ["Incorrect Email"]
      }
	  end
	end
  
end
