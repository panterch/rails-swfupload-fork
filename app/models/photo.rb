class Photo < ActiveRecord::Base
  has_attachment :content_type => ['image/tiff', :image],
                 :storage => :file_system,
                 :max_size => 1000.megabyte

  validates_as_attachment
end
