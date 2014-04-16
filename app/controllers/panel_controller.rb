class PanelController < ApplicationController
  def show
    @json_data = User.find(session[:user_id]).as_json.to_json
  end
end