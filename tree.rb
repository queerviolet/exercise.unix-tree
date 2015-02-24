

def print_directory(directory)
  print directory
  i=0
  n='  '
  Dir.foreach(directory){|file|
    if Dir.exist?("#{directory}/#{file}") && file != '.' && file != '..'
      puts file
      i+=1
      print_directory("#{directory}/#{file}")
    else
      puts "   #{file}"
    end
  }
end

# p print_directory('../tree-utility-challenge')

def check_directory
  if ARGV.empty?
    return print_directory('.')
  else
    return print_directory(ARGV.join(''))
  end
end

p check_directory()
