# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def all_blank?(attributes)
    attributes.all? do |key, value|   
      key == '_destroy' || value == '0'|| value.blank? ||
      value.is_a?(Hash) && all_blank?(value)
    end
  end
end
