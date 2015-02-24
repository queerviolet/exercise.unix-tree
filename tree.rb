# require 'pry'
#draft one
# Dir.entries('/Users/apprentice/Desktop/tree-utility-challenge').select do |entry|
#   puts entry
# end
# puts Dir.pwd
# binding.pry

#draft two - recursive
def tree_maker(dir)

  # Dir.entries.all? {|entry| return File.join('.', entry) if File.file?(entry)}

  Dir.entries(dir).select do |entry|
    if entry == '..' || entry == '.'
      next
    elsif File.directory?(entry)
      tree_maker(entry)
      puts entry
      # puts File.join('entry', tree_maker(entry))
    else

      puts File.join('.', entry)
      # binding.pry

    end
  end


end
tree_maker('.')

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
