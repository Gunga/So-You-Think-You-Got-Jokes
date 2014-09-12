require_relative '../../config/application'
require 'term/ansicolor'

class GameView
  @@c = Term::ANSIColor
  def self.intro
    clear
    puts @@c.yellow <<-INTRO

    SO YOU THINK YOU GOT JOKES?
    WELCOME!

Instructions:
    -You will be prompted with a joke
    -You need to choose the correct punchline
    -A correct punchline earns you 2 points
    -An incorrect punchline removes 2 points from your score
    -You begin with 5 points
    -Earn 10 points to win
    -If you reach 0, you get booted off of the stage
___________________________________
    1-Start Game
    2-Quit
    INTRO
    say("So you think you got jokes? Welcome!")
    input = get_choice
  end

  def self.prompt(joke)
    clear
    prompt_joke(joke.description)
    display_punchlines(joke.punchlines)
    say(joke.description)
    get_choice
  end

  def self.prompt_joke(description)
    puts @@c.red "Opponent says:"
    puts @@c.red description
  end

  def self.display_punchlines(punchlines)
    puts @@c.blue <<-CHOICES
___________________________________
1- #{punchlines.first.description}
2- #{punchlines.last.description}
___________________________________
    CHOICES
  end

  def self.get_choice
    print @@c.green "Choose:=>"
    gets.chomp
  end

  def self.display_feedback(result, score)
    display_result(result)
    display_score(score)
  end

  def self.display_result(result)
    if result=="correct"
      puts "AWESOME! GET READY FOR ANOTHER"
      play('laughter.mp3', 4)
    else
      puts "WRONG!!! YOU LOSE POINTS"
      play('crickets.mp3', 4)
    end
  end

  def self.display_score(score)
    puts "Current Score: #{score}"
  end


  def self.win_message
    clear
    puts <<-WIN
    YOU ARE THE BEST JOKER AROUND!
    YOU SHOULD CONSIDER A CAREER IN
    THIS AND QUIT CODING!
    WIN
    say("YOU ARE THE BEST JOKER AROUND! YOU SHOULD CONSIDER A CAREER IN THIS AND QUIT CODING!")
  end

  def self.lose_message
    clear
    puts <<-LOSE
    THANK GOD YOU KNOW HOW TO CODE.
    YOU WOULD DIE AS A COMEDIAN!!
    LOSE
    say("THANK GOD YOU KNOW HOW TO CODE. YOU WOULD DIE AS A COMEDIAN!!")
  end

  def self.quit_message
    clear
    puts @@c.red
    puts <<-QUIT
    CAN'T TAKE THE PRESSURE?
    THIS THING ISN'T FOR EVERYONE.
    GOOD BYE!
    QUIT
  end

  def self.clear
    print "\e[2J"
    print "\e[H"
  end

  def self.say(words)
    `say #{words}`
  end

  def self.play(file, seconds)
    laughter_path  = APP_ROOT.join('app', 'assets', file).to_s
    `afplay -t #{seconds} #{laughter_path}`
  end
end
