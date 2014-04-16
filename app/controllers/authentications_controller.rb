class AuthenticationsController < ApplicationController
  def create
    user = User::Upserter.new(request.env['omniauth.auth']).perform
    sign_in(user)
    redirect_to '/panel'
  end
end