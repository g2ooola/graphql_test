module InitSecret
  extend ActiveSupport::Concern

  included do
    before_create :init_secret
  end

  private

  def init_secret
    self.secret = SecureRandom.hex(10)
  end
end