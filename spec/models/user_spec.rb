require 'rails_helper'

RSpec.describe User, type: :model do
  context "#validation" do
    it "email is required" do
      user = build(:user)
      user.email = nil

      expect{user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "email is unique" do
      user1 = build(:user)
      user2 = create(:user)
      user1.email = user2.email

      expect{user1.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "password is required" do
      user = build(:user)
      user.password = nil

      expect{user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

end
