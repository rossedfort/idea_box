class WelcomeController < ApplicationController
  def show
    @user = User.new
    render :show
  end
end
