require 'pry'
def help
  puts "I accept the following commands:"
  puts " - help : displays this help message"
  puts " - list : displays a list of songs you can play"
  puts " - play : lets you choose a song to play"
  puts " - exit : exits this program"
  
end
  

def list(songs)
  songs.each_with_index do |track, i|
    puts "#{i+1}. #{track}"
  end
end

def get_song(input,songs)
  songs.find do |track|
    track.start_with?(input) || input.to_i - 1 == songs.index(track)
  end
end

def play(songs)
  puts "Please enter a song name or number:"
  input = gets.chomp
  song_name = get_song(input, songs)
  if song_name
    puts "Playing #{song_name}"
  else
    puts "Invalid input, please try again"
  end
end



def exit_jukebox
  puts "Goodbye"
end



def run(songs)
  input = ""
  help
  while input != "exit"
    puts "Please enter a command:"
    input = gets.chomp.downcase
    help if input == "help"
    list(songs) if input == "list"
    play(songs) if input == "play"
  end
  exit_jukebox

end