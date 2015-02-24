Dir.glob("**/*", File::FNM_DOTMATCH).each do |entry|
  puts [".", ".."].include?(entry) ? "#{entry}" : "./#{entry}"
end

