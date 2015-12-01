class AddTopicToBlogs < ActiveRecord::Migration
  def change
     add_column :blogs, :topic, :text
  end
end
