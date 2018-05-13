$image_extensions = %w(.png .jpg .jpeg)

def image?(file)
  $image_extensions.include?(File.extname(file))
end

def rename(file)
  new_name = file.gsub(/\[0\]/, '')
  File.rename(file, new_name)
end

Dir.foreach("./") do |file| 
  if image?(file)
    rename(file)
  end
end