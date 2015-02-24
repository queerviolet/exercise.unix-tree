

def tree_crawler(directory)
  #puts Dir.glob(directory, File::FNM_DOTMATCH)
 # current_dir = Dir.glob(directory)
  #p current_dir
  #p Dir.glob(directory)

  Dir.foreach(directory) do |x|
  #directory.each { |x|
    if x == "." || x == ".."

    elsif File.directory? x
      puts x
      tree_crawler(x.path)
    else
      puts x
    end
  end
end

tree_crawler(Dir.pwd)
