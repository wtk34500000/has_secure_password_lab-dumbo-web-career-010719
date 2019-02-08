class UsersController < ApplicationController
    def new
        render :new
    end

    def create
        user=User.new(name: params[:user][:name], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
           
        if params[:user][:password] == params[:user][:password_confirmation]
                user.save   
                session[:user_id]=user.id
                    redirect_to "/welcome"
            else
                redirect_to "/users/new"
            end
    end
end
