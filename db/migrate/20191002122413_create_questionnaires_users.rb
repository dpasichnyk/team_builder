class CreateQuestionnairesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :questionnaires_users do |t|
      t.belongs_to :user
      t.belongs_to :questionnaire

      t.timestamps
    end
  end
end
