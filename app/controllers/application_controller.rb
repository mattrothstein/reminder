class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, prepend: true
  before_action :authenticate_user!
end
