class UsersController < ApplicationController
    before_action :set_user, only: %i[show edit upadate destroy]

def index
    @users = User.all
    render json: @users 
end

def show 
   @users = User.find(params[:id])
end

def new 
    @users = User.new
end

def edit 
end

def  create 
    @user = User.new(user_params)
    if @user.save
        render json: @users


        
    else
        render :new
    end

end

def upadate
    if @user.update(user_params)
        redirect_to user_url(@user)
    else 
        render :edit
    end
end

def destroy
    @user.destroy
    redirect_to users_url

end

private 
def set_user 
    @user = User.find(params[:id])
end


def user_params
    params.require(:user).permit(:username,:name)
    end
end


