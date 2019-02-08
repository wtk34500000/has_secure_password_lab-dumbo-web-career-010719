class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        # byebug
            @user = User.find_by(name: params[:user][:name])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to welcome_path
            else
                render :new
            end 
    end
    
end
