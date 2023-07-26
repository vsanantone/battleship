class Game
  def intro
    welcome = "Welcome to BATTLESHIP!"
    play = "Enter p to play. Enter q to quit."
    puts "#{welcome}\n#{play}" 
    return "#{welcome}\n#{play}" 
  end

  def start_game
    intro
    choice = gets.chomp.downcase
    
    loop do
      if choice == "p"
        puts "Preapre your Battleships!"
      elsif choice == "q"
        puts "Better swim to shore, the sharks are hungry!"
        break
      else
        puts "That's not what we asked you..."
      end
      break
    end
  end
end

