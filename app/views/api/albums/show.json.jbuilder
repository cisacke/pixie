json.extract!(@album, :title, :description, :id, :image_url)
json.extract!(@album.user, :f_name, :l_name)
json.userId(@album.user, :id)
json.num_photos(@album.photos.count)
json.photos do
  json.array!(@album.photos) do |photo|
     json.extract!(photo, :title, :description, :id, :x_pixels, :y_pixels)
     json.image_url asset_path(photo.image.url(:original))
   end
end
