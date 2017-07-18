class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
@user = User.new(params[:user])
if @user.save
  session[:user_id] = @user.id
  redirect_to root_url, :notice => "Thank you for Signed up!"
else
  render "new"
end
  end

  def edit

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
respond_to do |format|
  if @recipe.update(user_params)
    format.html { redirect_to @user, notice: 'User was successfully updated.' }
    format.json { render :show, status: :ok, location: @user }
  else
    format.html { render :edit }
    format.json { render json: @user.errors, status: :unprocessable_entity }
  end
end
  end


def show
  @user = User.find(params[:id])
end

  private
# Use callbacks to share common setup or constraints between actions.
def set_user
  @user = User.find(params[:id])
end

# Never trust parameters from the scary internet, only allow the white list through.
def user_params
  params.require(:recipe).permit(:id, :name, :email, :password, :password_confirmation, :avatar)

end
end
