class Image < ApplicationRecord
  has_one_attached :file, service: :local
  belongs_to :patient

  validates :file, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }

  def image_file
    rails_blob_url(file) if file.attached?
  end
end
