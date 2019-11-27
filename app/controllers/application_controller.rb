class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:last_name,:first_name,:last_kana,:first_kana,
      :year,:month,:date,:tell_no,:self_info,:image])
  end
end
