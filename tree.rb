
#Pseudocode
# 1. make a method called print_content
# 2. make a loop to get all the entries in the current directory
# 3.   if the entry is a directory print the directory name and
#      call print_content recursivly
# 4.   else print the filename
def print_content()
  Dir.glob("*").each do |entry|
    if File.directory?(entry)
      puts "#{entry}"
      puts "#{File.directory?(entry)}"
      Dir.chdir("#{entry}")
      print_content()
      Dir.chdir("..")
    else
      puts "#{entry}"
    end
  end
end

print_content()
