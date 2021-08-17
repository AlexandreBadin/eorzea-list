class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :server
      t.string :job
      t.string :encountered_in
      t.text :reason
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
