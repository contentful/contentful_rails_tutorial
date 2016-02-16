class CreateContentfulUsers < ActiveRecord::Migration
  def change
    create_table :contentful_users do |t|
      t.string :name
      t.string :space_id
      t.string :access_token
      t.string :content_type

      t.timestamps null: false
    end
  end
end
