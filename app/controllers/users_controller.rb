class UsersController < ApplicationController
before_filter :admin,   :only => :destroy
  
  def index
    @title = "Users"
    @users = User.all
  end
  
  def new
      @title = "Sign in"
      @user = User.new
    end
    def show
      @user = User.find(params[:id])
    end
    def create
      @user = User.new(params[:user])
      if @user.save
        redirect_to root_url, :flash => { :success => "Signed up!" }
      else
        render "new"
      end
    end
    
    def destroy
      @user.destroy
      redirect_to users_path, :flash => { :success => "User destroyed." }
    end
    
    def edit
      @title = "Edit"
    end

    def update
      if @user.update_attributes(params[:user])
        redirect_to @user, :flash => { :success => "Profile updated." }
      else
        @title = "Edit user"
        render 'edit'
      end
    end
    
end
