# frozen_string_literal: true

class HomeController < ApplicationController
  include MenuResources
  before_action :set_resources, only: %i[index]
  layout 'home'

  def index; end

end
