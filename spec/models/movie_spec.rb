require 'rails_helper'

RSpec.describe Movie, type: :model do
  context "#validation" do
    it "title is required" do
      movie = build(:movie)
      movie.title = nil

      expect{movie.save}.to raise_error(ActiveRecord::NotNullViolation)
    end

    it "text is required" do
      movie = build(:movie)
      movie.text = nil

      expect{movie.save}.to raise_error(ActiveRecord::NotNullViolation)
    end
  end

  context "#associations" do
    it 'should belong to a category' do
      movie = create(:movie)
      expect(movie.category).to be_truthy
    end

    it 'should belong to a user' do
      movie = create(:movie)
      expect(movie.user).to be_truthy
    end
  end
end
