# frozen_string_literal: true

class ApplicationController < ActionController::Base
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
    params.require(:subscriber).permit(:name, :email)
  end
end
