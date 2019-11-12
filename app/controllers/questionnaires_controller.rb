class QuestionnairesController < ApplicationController
  before_action :authenticate_user!

  def show
    @questionnaire = Questionnaire.current
  end

  def update
    @questionnaire = Questionnaire.current

    if @questionnaire&.active?
      @questionnaire.users |= [current_user]
      flash[:success] = "Yay! You've successfully registered for today's event!"
    else
      flash[:error] = 'Unable to register you :('
    end

    redirect_to root_path
  end

  def destroy
    @questionnaire = Questionnaire.current
    @questionnaire.users.delete(current_user)

    redirect_to root_path
  end
end