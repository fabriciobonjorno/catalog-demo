class AddUnsubscribeToSubscribers < ActiveRecord::Migration[6.1]
  def change
    add_column :subscribers, :unsubscribe, :boolean, default: false
  end
end
