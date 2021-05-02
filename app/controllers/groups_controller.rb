class GroupsController < ApplicationController
  include MenuResources
  before_action :set_resources, :only => %i[show]
  layout "home"

  def show
    @group = Group.friendly.find(params[:id])
  end
end
