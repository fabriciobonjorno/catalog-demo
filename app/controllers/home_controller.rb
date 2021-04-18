class HomeController < ApplicationController
  layout 'home'
  def index
    render file: 'public/index.html'
  end
end
