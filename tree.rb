
#draft one
# Dir.entries('/Users/apprentice/Desktop/tree-utility-challenge').select do |entry|
#   puts entry
# end
# puts Dir.pwd
# binding.pry
  Dir.entries('.').select do |entry|
    if entry == '..'
      next
    elsif File.directory?(entry)
      puts entry
    else
      puts File.join('.',entry)
    end
  end
