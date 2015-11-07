class AddImageIdToIdeas < ActiveRecord::Migration
  def change
    add_reference :ideas, :image, index: true, foreign_key: true
  end
end
