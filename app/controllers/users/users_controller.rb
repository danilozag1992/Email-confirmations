class Users::SessionsController < Devise::SessionsController
  def create
    # custom sign-in code
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid."
    end
  end
end