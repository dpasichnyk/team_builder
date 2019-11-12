class CreateQuestionnaires < ActiveRecord::Migration[6.0]
  def change
    create_table :questionnaires do |t|
      t.boolean :active, default: true
      t.datetime :ends_at, default: nil

      t.timestamps
    end
  end
end
