class Song < ActiveRecord::Base

  belongs_to :user

  validates :title, presence: true, length: { maximum: 40 }
  validates_format_of :url, with: /\A(http(?:s)?).+/ , allow_blank: true
  validates :author, presence: true, length: { maximum: 40 }
end

