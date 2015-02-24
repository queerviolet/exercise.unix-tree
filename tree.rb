

def tree_crawler(directory)
  # puts "entering tree_crawler('#{directory}')"
  path = "#{directory}/"
  Dir.foreach(directory) do |x|


    if x == "." || x == ".."

    elsif File.directory?(path+x)
      puts path+x
      tree_crawler(path+x)
    else
      # puts "'#{x}' is not a directory"
      puts x
      # printf("%4s\n", x)
    end
  end
end

tree_crawler(Dir.pwd)
