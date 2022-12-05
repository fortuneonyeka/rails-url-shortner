class Url < ApplicationRecord
validates :name, format: {with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix, message: ", enter a valid url" }
  before_save :set_slug
  


  def shortend_url
    "#{ENV['HOST_URL']}/r?slug=#{slug}"
  end

  private

  def set_slug
    self.slug = SecureRandom.hex(1) if slug.nil?
  end


  
end
