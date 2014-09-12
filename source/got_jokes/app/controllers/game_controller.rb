require_relative '../../config/application'

class GameController

  def self.run
    first_choice = GameView.intro
    @@game_over = false
    @@game_score = 5
    @@all_jokes = Joke.all.to_a

    if first_choice == "1"
      until @@game_over do
        @@result = "wrong"
        selected_joke = select_random_joke
        input = GameView.prompt(selected_joke)
        check_user_response(input)
        GameView.display_feedback(@@result, @@game_score)
        sleep(3)
        check_score
      end
    elsif first_choice == "2"
      GameView.quit_message
    else
      run
    end
  end

  def self.check_score
    if @@game_score < 1
      @@game_over = true
      GameView.lose_message
    elsif @@game_score > 9
      @@game_over = true
      GameView.win_message
    end
  end

  def self.game_over
    @@game_over
    # equals to false unless
    # game_over is true if:
    #   user quits manually (press quit?)
    #   user score reaches maximum (10)
    #   user score reached minimum (0)
  end

  def self.select_random_joke
    unless @@all_jokes.empty?
      @@current_joke = @@all_jokes.shuffle!.pop
    else
      GameView.call_engineer
      exit!
    end
  end

  def self.check_user_response(input)
    if input == "quit"
      @@game_over = true
      GameView.quit_message
      exit!
    elsif input == "1" || input == "2"
      @@game_score += @@current_joke.punchlines[input.to_i-1].score

      unless @@current_joke.punchlines[input.to_i-1].score <= 0
        @@result = "correct"
      end
    else
      GameView.invalid_response
      @@game_score -= 2
    end
  end

end



