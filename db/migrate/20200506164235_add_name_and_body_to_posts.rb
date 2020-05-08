class AddNameAndBodyToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :name, :string
    add_column :posts, :body, :text
  end
end
