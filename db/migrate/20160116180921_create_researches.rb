class CreateResearches < ActiveRecord::Migration
  def change
    create_table :researches do |t|
      t.string :name
      t.string :period_of_execution
      t.string :cost

      t.timestamps
    end
  end
end
