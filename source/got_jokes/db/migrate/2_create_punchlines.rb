require_relative '../../config/application'

class CreatePunchlines < ActiveRecord::Migration
  def change
      create_table :punchlines do |t|
        t.string :description
        t.references :joke
        t.integer :score
        t.timestamps
      end
  end
end
