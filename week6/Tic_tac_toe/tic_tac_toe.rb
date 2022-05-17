# frozen_string_literal: true

class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [6, 4, 2],
    [0, 4, 8]
  ].freeze
  STOP_GAME_COMMAND = 'end'

  def initialize(board = nil)
    board ||= [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @board = board
  end

  def play
    player_name
    puts "if you want to end game enter: 'end'"
    display_board
    turn until is_over?
    check_finish
    who_won
  end

  private

  def player_name
    puts 'Enter first player Name: '
    @first_player = gets.strip
    puts 'Enter thecond player Name: '
    @second_player = gets.strip
    puts "\n"
  end

  def defoult_name
    if @first_player.empty?
      @first_player = 'X'
    elsif @second_player.empty?
      @second_player = 'O'
    else
      return
    end
  end

  def display_board
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts ' --------- '
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts ' --------- '
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(position, token = 'X')
    @board[position] = token
  end

  def position_taken?(input)
    @board[input] == 'X' || @board[input] == 'O'
  end

  def valid_move?(input)
    input.between?(0, 8) && !position_taken?(input)
  end

  def turn
    puts 'Choose a spot between 1-9'
    spot = gets.strip
    check_finish(spot)
    spot = input_to_index(spot)
    if valid_move?(spot)
      move(spot, current_player)
      display_board
    else
      puts "\n Entered value: #{spot+1} is used  \n "
      turn
    end
  end

  def turn_count
    taken = 0
    @board.each do |i|
      taken += 1 if %w[X O].include?(i)
    end
    taken
  end

  def current_player
    if turn_count.even?
      'X'
    else
      'O'
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
        @board[combo[1]] == @board[combo[2]] &&
        position_taken?(combo[0])
    end
  end

  def is_full?
    turn_count == 9
  end

  def draw?
    !won? && is_full?
  end

  
  def is_over?
    won? || is_full? || draw?
  end

  def winner
    return unless winner = won?

    @board[winner.first]
  end

  def who_won
    if won?
      winner = winner()
      puts " Congratulations ! #{define_wich_player_won()}"
    elsif draw?
      puts "both of you won !!! it men's draw"
    end
  end

  def define_wich_player_won
    winner = winner()
    defoult_name
    if winner == 'X'
      then print @first_player
      else
        print @second_player
      end
  end

  def check_finish(input = nil)
    if input == STOP_GAME_COMMAND || input == STOP_GAME_COMMAND.upcase
      puts "Game was ended !!!"
      exit
    else
      return
    end
  end
end

#TicTacToe.new().play
