require_relative '../../config/application'

class Joke < ActiveRecord::Base
  has_many :punchlines
end
