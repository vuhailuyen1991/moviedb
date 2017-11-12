class Movie < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :ratings, :dependent => :delete_all

  scope :full_text_search, ->(text) { where('movies.title LIKE ? OR movies.text LIKE ?', "%#{text}%", "%#{text}%") }
  scope :by_category, ->(category_id) { joins(:category).where(categories: { id: category_id }) }
  scope :by_rating, ->(rate) { joins(:ratings).where(ratings: { rate: rate }) }

  def average_rating
    ratings.average(:rate).to_i
  end
end
