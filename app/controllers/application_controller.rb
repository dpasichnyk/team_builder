class ApplicationController < ActionController::Base
  before_action :permit_devise_sign_up_parameters, if: :devise_controller?
  before_action :redirect_to_relevant_path, unless: :devise_controller?

  protected

  def permit_devise_sign_up_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name department_id])
  end

  def redirect_to_relevant_path
    return unless current_user

    if Questionnaire.current
      redirect_to questionnaires_show_path unless controller_name == 'questionnaires'
    elsif current_user.current_group
      redirect_to groups_show_path unless controller_name == 'groups'
    end
  end
end
