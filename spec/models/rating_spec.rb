require 'rails_helper'

RSpec.describe Rating, type: :model do
  context "#validation" do
    it "rate is from 1 to 5" do
      rating = build(:rating)
      rating.rate = 6

      expect{rating.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "user and movie combination is unique" do
      existing_rating = create(:rating)
      rating = Rating.new
      rating.rate = 2
      rating.user_id = existing_rating.user_id
      rating.movie_id = existing_rating.movie_id

      expect{rating.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
