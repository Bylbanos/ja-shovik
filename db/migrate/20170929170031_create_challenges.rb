class CreateChallenges < ActiveRecord::Migration[5.1]
  def change
    create_table :challenges do |t|
      t.boolean "fasted", default: false
      t.string "description", limit: 60

      t.timestamps
    end
  end
end
