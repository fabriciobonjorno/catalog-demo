# frozen_string_literal: true

class GroupsController < HomeController
  include MenuResources
  before_action :set_resources, only: %i[show]
  layout 'home'

  def show
    @group = Group.friendly.find(params[:id])
    @subscriber = Subscriber.new
  end
end
