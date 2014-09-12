require_relative '../../config/application'

class Punchlines < ActiveRecord::Migration
  def change
      create_table :punchlines do |t|
        t.string :description
        t.int :joke_id
        t.int :score
        t.timestamps
      end
  end
end
