class GroupsController < ApplicationController
  before_action :authenticate_user!

  def show
    @group = current_user.current_group
  end
end