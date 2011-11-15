require 'rubygems'
require 'dependence'

# Concatenates all the sass files into a single one
resolver = DependencyResolver.new(["lib/foundation.sass"], "lib") 
files = resolver.sorted_files

puts files
concatenator = Dependence::Concatenator.new(files.reverse)

sass = concatenator.concat_files do |name, content|
  content.gsub(/@import \S+$/, "")
end

File.open("compiled/foundation.sass", 'w') do |f|
  f.syswrite sass
end
