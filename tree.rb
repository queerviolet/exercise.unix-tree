def create_os(directory)
  Dir.glob("**", directory).each do |entry|
    if Dir.exist?(entry)
      create_os(entry)
    else
      puts entry
    end
  end
end

p create_os("Username/phase-1-guide/week-1/resources")
