def create_os(directory)
  Dir.glob("#{directory}/*").each do |entry|


    puts File.basename(entry)

    if Dir.exist?(entry)
      str = ' '
      print str
      create_os(entry)
    end

  end
end

create_os(Dir.pwd)
