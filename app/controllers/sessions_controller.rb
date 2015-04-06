class SessionsController < ApplicationController
  def new
  end

  def create
    # Looking for a user with the given email address and storing either that user (if the a user was found) or `nil` (if no user was found) in the `user` variable
    user = User.find_by(email: params[:email])
    # If we found a user with that email address AND the given password works with our password digest
    if user && user.authenticate(params[:password])
      # Store the user's id in the session, to keep track of who's signed in (to learn more about this seemingly magical `session` variable Rails provides, [check out these docs](http://guides.rubyonrails.org/security.html#sessions))
      session[:user_id] = user.id
      # Redirect to the `root_url` and show a notice that the user has successfully signed in
      redirect_to root_url, notice: 'Successfully signed in!'
      # If the credentials the user gave were bad
    else
      # Alert the user that their credentials are bad
      flash.alert = 'Invalid email/password combination. Please try again.'
      # On the view for the `new` action
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Successfully signed out!'
  end
end
