class Users::SessionsController < ApplicationController
  def new
    redirect_to omniauth_authorize_path(resource_name, :facebook)
  end
end
