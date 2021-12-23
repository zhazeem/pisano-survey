class CreateSurveys < ActiveRecord::Migration[6.1]
  def change
    create_table :surveys do |t|
      t.belongs_to :customer
      t.string :name, limit: 255, null: false
      t.timestamps
    end
  end
end
