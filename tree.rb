require 'pry'
#draft one
# Dir.entries('/Users/apprentice/Desktop/tree-utility-challenge').select do |entry|
#   puts entry
# end
# puts Dir.pwd
# binding.pry

#draft two - recursive
def tree_maker(dir)

  # Dir.entries.all? {|entry| return File.join('.', entry) if File.file?(entry)}

  Dir.entries(dir).each do |entry|
    # binding.pry
    if entry == '..' || entry == '.'
      next
    elsif File.directory?("test_directory/#{entry}")
      puts entry
      tree_maker(entry)
      # puts File.join('entry', tree_maker(entry))
    else
      #Dir.glob(File.join("**", entry))
      puts File.join('.', entry)


    end
  end


end
tree_maker('../tree-utility-challenge')

# Dir.entries('.').select do |entry|
#     if entry == '..'
#       next
#     elsif File.directory?(entry) #== false
#       puts entry
#     else
#       puts File.join('.',entry)
#     # if File.directory?(entry)
#       # tree_maker
#       # puts Dir.entries(entry)
#     # else
#     #   puts File.join('.',entry)
#     end
#   end
