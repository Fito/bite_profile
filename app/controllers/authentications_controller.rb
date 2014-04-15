class AuthenticationsController < ApplicationController
  def create
    render json: request.env['omniauth.auth']
  end
end