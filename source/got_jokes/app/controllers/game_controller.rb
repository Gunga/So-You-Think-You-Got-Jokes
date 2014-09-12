require_relative '../../config/application'

class GameController

  def self.run
    GameView.intro
    @@game_over = false

    until @@game_over do
      selected_joke = select_random_joke
      GameView.prompt(selected_joke)
      check_user_response
      GameView.display_feedback(result, score)
    end

      GameView.outcome
  end


  def game_over
    @@game_over
    # equals to false unless
    # game_over is true if:
    #   user quits manually (press quit?)
    #   user score reaches maximum (10)
    #   user score reached minimum (0)
  end

  def select_random_joke
    # select_random_joke
    #   Joke.find
    # get_corresponding_punchlines
    #   Punchline.find_by_joke_id
    Joke.all.sample
  end

  def check_user_response
    # check if punchline is correct
    # apply result to total_score
  end

end



