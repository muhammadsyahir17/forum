class AddTopicIdToTopic < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :topic_id, :integer
  end
end
