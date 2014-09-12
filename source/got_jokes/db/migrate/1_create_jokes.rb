require_relative '../../config/application'

class CreateJokes < ActiveRecord::Migration
  def change
      create_table :jokes do |t|
        t.string :description
        t.timestamps
      end
  end
end
