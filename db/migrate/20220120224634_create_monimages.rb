class CreateMonimages < ActiveRecord::Migration[7.0]
  def change
    create_table :monimages do |t|
      t.string :monimagename
      t.references :imageable, polymorphic: true
      
      t.timestamps
    end
  end
end
