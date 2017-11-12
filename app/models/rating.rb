class Rating < ApplicationRecord
  validates :rate, :inclusion => { :in => 1..5 }
  validates :user_id, uniqueness: {scope: :movie_id}

  belongs_to :movie
  belongs_to :user
end
