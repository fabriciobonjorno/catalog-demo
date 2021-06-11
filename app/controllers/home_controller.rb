# frozen_string_literal: true

class HomeController < ApplicationController
  include MenuResources
  before_action :set_resources, only: %i[index search]
  layout 'home'

  def index
    @subscriber = Subscriber.new
  end

  def newsletter
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      redirect_to((request.referer || '/'), notice: 'Parabéns agora você está por dentro das novidades!')
    else
      redirect_to((request.referer || '/'), alert: 'E-mail já cadastrado ou inválido')
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:name, :email, :unsubscribe)
  end
end
