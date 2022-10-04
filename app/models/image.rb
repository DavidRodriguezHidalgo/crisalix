class Image < ApplicationRecord
  has_one_attached :file, service: :local
  belongs_to :patient

  def image_file
    rails_blob_url(file) if file.attached?
  end
end
