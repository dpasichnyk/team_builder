class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.belongs_to :admin

      t.boolean :active

      t.timestamps
    end
  end
end
