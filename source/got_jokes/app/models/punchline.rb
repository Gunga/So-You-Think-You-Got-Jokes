require_relative '../../config/application'

class Punchline < ActiveRecord::Base
  belongs_to :joke
end
