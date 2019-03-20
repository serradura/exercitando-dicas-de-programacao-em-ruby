class Game
  def initialize
    @score_pc_player = [0, 0] unless defined?(@total)
    @total = 0

    puts '=========================================='
    puts 'Let\'s take turns counting using numbers from 1 to 10.'\
         ' The first person to get to 100 wins'
    sleep 0.5

    who_goes_first
    continue?
  end

  def who_goes_first
    print 'Who goes first? You or me? '

    starts = gets.chomp.downcase.strip

    if starts == 'you'
      game_pc_starts
    elsif starts == 'me'
      game_player_starts
    else
      puts 'Invalid answer'
      who_goes_first
    end
  end

  def pc_choice
    puts "I choose the number #{@total.zero? ? 1 : 11 - @player_choice}"

    @total += @total.zero? ? 1 : 11 - @player_choice

    puts "The sum is now #{@total}"
  end

  def pc_won?
    if @total >= 100

      puts 'You lose!!! \\o/'

      @score_pc_player[0] += 1

      puts "SCOREBOARD: PC #{@score_pc_player[0]} x #{@score_pc_player[1]} You"

    end

    @total >= 100
  end

  def player_won?
    if @total >= 100

      puts 'You won!!! \\o/'

      @score_pc_player[1] += 1

      puts "SCOREBOARD: PC #{@score_pc_player[0]} x #{@score_pc_player[1]} You"
    end

    @total >= 100
  end

  def pc_choice_2
    if @total % 11 == 1
      rand(1..10)

    elsif (@total % 11).zero?
      1
    else
      12 - (@total % 11)
    end
  end

  def player_choice
    print 'Your turn, pick a number from 1 to 10: '

    @player_choice = gets.chomp.to_i

    check_player_answer

    sleep 1
  end

  def check_player_answer
    if @player_choice.between?(1, 10)
      @total += @player_choice

      puts "The sum is now #{@total}"
      puts '=========================================='

    else
      puts 'Invalid answer, you should pick a number from 1 to 10'
      player_choice
    end
  end

  def game_pc_starts
    puts 'Okay, I\'ll go first'

    while @total < 100
      pc_choice

      break if pc_won?

      player_choice
    end
  end

  def game_player_starts
    puts 'Okay, you go first'

    while @total < 100
      player_choice

      break if player_won?

      pc = pc_choice_2

      puts "I choose the number #{pc}"

      @total += pc

      puts "The sum is now #{@total}"

      break if pc_won?
    end
  end

  def continue?
    print 'Wanna play again?(yes or no) '

    replay = gets.chomp.downcase.strip

    if replay == 'yes'
      initialize
    elsif replay == 'no'
      puts 'Okay, goodbye! \\o'
    else
      puts 'Invalid answer'

      continue?
    end
  end
end

Game.new
