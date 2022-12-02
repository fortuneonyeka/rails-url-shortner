class Url < ApplicationRecord
  before_save :set_slug

  private

  def set_slug
    self.slug = SecureRandom.hex(3) if slug.nil?
  end
end
