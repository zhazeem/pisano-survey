class CreateUserSurveys < ActiveRecord::Migration[6.1]
  def change
    create_table :user_surveys do |t|
      t.belongs_to :survey
      t.belongs_to :user
      t.timestamps
    end
  end
end
