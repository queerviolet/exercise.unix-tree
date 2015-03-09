#!/usr/bin/env ruby

$files = 0
$dirs = 0

def print_tree(path, prefix='')
  $files += 1
  return [1, 0] if not Dir.exist? path
  $files -= 1
  $dirs += 1
  children = Dir.entries(path).
    reject { |e| e[0] == '.' }.
    map { |p| File.join(path, p) }
  #children = Dir[File.join(path, '*')]
  children.each_with_index do |f, i|
    if i < children.length - 1
      puts prefix + '├── ' + File.basename(f)
      print_tree(f, prefix + '│   ')
    else
      puts prefix + '└── ' + File.basename(f)
      print_tree(f, prefix + '    ')
    end
  end
end

root = ARGV[0] || '.'
exit(1) if not File.exist? root
puts root
print_tree(root)
puts
puts "#{$dirs - 1} directories, #{$files} files"
