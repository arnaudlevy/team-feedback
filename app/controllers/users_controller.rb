class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_indicators
  skip_before_filter :require_login, only: [:new, :create]
  
  # TODO lock others if not admin

  # GET /users
  def index
    @users = User.all
  end

  def me
    @user = current_user
  end

  def edit_me
    @user = current_user
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render action: 'edit' 
      end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
    def set_indicators
      @indicators = Indicator.all
    end
    def user_params
      params[:user].permit(:firstname, :lastname, :email, :password, :team_id, :admin)
    end
end
