class UsersController < ApplicationController
  # Встроенный в девайз фильтр — посылает незалогиненного пользователя везде, кроме show
  before_action :authenticate_user!, except: [:show]

  # Задаем объект @user для шаблонов и экшенов
  before_action :set_current_user, except: [:show]




  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/1/edit
  def edit
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: I18n.t('controllers.users.updated') }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_current_user
    @user = current_user
  end

    # список того, что разрешено передавать в качестве параметров
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
