require_relative '../../config/application'
require 'term/ansicolor'

class GameView
  @@c = Term::ANSIColor
  def self.intro
    clear
    puts @@c.yellow <<-INTRO

    _
   | |
    \\ \\   ___      _   _  ___  _   _
     \\ \\ / _ \\    | | | |/ _ \\| | | |
 _____) ) |_| |   | |_| | |_| | |_| |
(______/ \\___( )   \\__  |\\___/ \\____|
             |/   (____/
      _     _       _
 _   | |   (_)     | |
| |_ | | _  _ ____ | |  _    _   _  ___  _   _
|  _)| || \\| |  _ \\| | / )  | | | |/ _ \\| | | |
| |__| | | | | | | | |< (   | |_| | |_| | |_| |
 \\___)_| |_|_|_| |_|_| \\_)   \\__  |\\___/ \\____|
                            (____/
                       _       _            ____
             _        (_)     | |          (___ \\
  ____  ___ | |_       _  ___ | |  _ ____  ___ ) )
 / _  |/ _ \\|  _)     | |/ _ \\| | / ) _  )/___)_/
( ( | | |_| | |__     | | |_| | |< ( (/ /|___ |
 \\_|| |\\___/ \\___)   _| |\\___/|_| \\_)____|___(_)
(_____|             (__/


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
      puts "AWESOME! YOU'RE KILLING IT!"
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
    puts @@c.green
    puts <<-WIN
 __    __  ____  ____   ____     ___  ____   __
|  |__|  ||    ||    \\ |    \\   /  _]|    \\ |  |
|  |  |  | |  | |  _  ||  _  | /  [_ |  D  )|  |
|  |  |  | |  | |  |  ||  |  ||    _]|    / |__|
|  `  '  | |  | |  |  ||  |  ||   [_ |    \\  __
 \\      /  |  | |  |  ||  |  ||     ||  .  \\|  |
  \\_/\\_/  |____||__|__||__|__||_____||__|\\_||__|

    YOU ARE THE BEST JOKER AROUND!
    YOU SHOULD CONSIDER A CAREER IN
    THIS AND QUIT CODING!
    WIN
    say("YOU ARE THE BEST JOKER AROUND! YOU SHOULD CONSIDER A CAREER IN THIS AND QUIT CODING!")
  end

  def self.lose_message
    clear
    puts @@c.red
    puts <<-LOSE
 _____   ___  ___  ___ _____   _____  _   _ ___________ _
|  __ \\ / _ \\ |  \\/  ||  ___| |  _  || | | |  ___| ___ \\ |
| |  \\// /_\\ \\| .  . || |__   | | | || | | | |__ | |_/ / |
| | __ |  _  || |\\/| ||  __|  | | | || | | |  __||    /| |
| |_\\ \\| | | || |  | || |___  \\ \\_/ /\\ \\_/ / |___| |\\ \\|_|
 \\____/\\_| |_/\\_|  |_/\\____/   \\___/  \\___/\\____/\\_| \\_(_)


    THANK GOD YOU KNOW HOW TO CODE.
    YOU WOULD DIE AS A COMEDIAN!!
    LOSE
    say("THANK GOD YOU KNOW HOW TO CODE. YOU WOULD DIE AS A COMEDIAN!!")
  end

  def self.quit_message
    clear
    puts @@c.red
    puts <<-QUIT
 _____   ___  ___  ___ _____   _____  _   _ ___________ _
|  __ \\ / _ \\ |  \\/  ||  ___| |  _  || | | |  ___| ___ \\ |
| |  \\// /_\\ \\| .  . || |__   | | | || | | | |__ | |_/ / |
| | __ |  _  || |\\/| ||  __|  | | | || | | |  __||    /| |
| |_\\ \\| | | || |  | || |___  \\ \\_/ /\\ \\_/ / |___| |\\ \\|_|
 \\____/\\_| |_/\\_|  |_/\\____/   \\___/  \\___/\\____/\\_| \\_(_)


    CAN'T TAKE THE PRESSURE?
    THIS THING ISN'T FOR EVERYONE.
    GOOD BYE!
    QUIT
  end

  def self.invalid_response
    clear
    puts @@c.cyan
    puts <<-INVALID
    ARE YOU KIDDING ME?

    THAT'S NOT EVEN AN
    OPTION!!!!!

    INVALID
  end

  def self.call_engineer
    clear
    puts @@c.red
    puts <<-CALL_MESSAGE
    THE ENGINEERS DIDN'T MAKE ENOUGH
    JOKES TO DEAL WITH SUCH A PERSISTENT
    USER SUCH AS YOURSELF. PLEASE CALL
    YOUR ENGINEER AND COMPLAIN ENDLESSLY.
    ALTERNATIVELY CALL THE IMMIGRATION OFFICE
    AND DEPORT THE ENGINEER.

    CALL_MESSAGE
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
