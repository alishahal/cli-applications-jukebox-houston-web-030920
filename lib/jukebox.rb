require 'pry'

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end

def list(songs)
  songs.each_with_index { |song, index|
    puts (index + 1).to_s + ". " + song
    }
end

def play(songs)
  puts "Please enter a song name or number:"
  user_response = gets.chomp
  output = ""
  songs.each_with_index { |song, index|
    if user_response == (index + 1).to_s || user_response == song
      output = "Playing #{song}"
    end
  }
  if output.include?("Playing")
    puts output
  elsif user_response == "list"
    list(songs)
    play(songs)
  else
    puts "Invalid input, please try again"
  end
end


def exit_jukebox
  puts "Goodbye"
end


def run(songs)
  help
  puts "Please enter a command:"
  user_response = gets.chomp
  while user_response != "exit"
    case user_response
      when "help"
        help
        puts "Please enter a command:"
        user_response = gets.chomp
      when "list"
        list(songs)
        puts "Please enter a command:"
        user_response = gets.chomp
      when "play"
        play(songs)
        puts "Please enter a command:"
        user_response = gets.chomp
      else
        puts "Invalid input, please try again"
        user_response = gets.chomp
    end
    exit_jukebox
  end
  
end 