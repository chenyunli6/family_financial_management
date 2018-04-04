class Post < ApplicationRecord
  belongs_to :user

  scope :recent, -> { order("id desc") }
  scope :published, -> { where(is_hidden: false) }

  def hidden!
    update_column(:is_hidden, true)
  end

  def publish!
    update_column(:is_hidden, false)
  end
end
