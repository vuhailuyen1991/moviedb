require 'rails_helper'

RSpec.describe Category, type: :model do
  context "#validation" do
    it "name is required" do
      category = build(:category)
      category.name = nil

      expect{category.save}.to raise_error(ActiveRecord::NotNullViolation)
    end
  end
end
