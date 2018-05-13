def mp3?(file)
  File.extname(file) == '.mp3'
end

def rename(file)
  new_name = file.gsub(/\[0\]/, '')
  File.rename(file, new_name)
end

Dir.foreach("./") do |file| 
	if mp3?(file)
    rename(file)
  end
end