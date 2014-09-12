require_relative 'config/application'

# puts "Put your application code in #{File.expand_path(__FILE__)}"

GameView.intro

GameView.prompt_joke("Why did the chicken?")
GameView.display_punchlines(["Great", "Other Side"])
