require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryBot.build(:user, email: "student@app.io", password: "good_password")
  end

  describe "validations" do 
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe "#is_password?" do 
    it "confirms the password is correct" do 
      expect(user.is_password?("good_password")).to be true
    end

    it "confirms a password is not correct" do
      expect(user.is_password?("bad_password")).to be false
    end
  end

  describe ".find_by_credentials" do
    before { user.save! }

    it "returns user if given good credentials" do
      expect(User.find_by_credentials("jonathan@fakesite.com", "good_password")).to eq(user)
    end

    it "returns nil if given bad credentials" do
      expect(User.find_by_credentials("jonathan@fakesite.com", "bad_password")).to eq(nil)
    end
  end

  describe "#reset_session_token!" do
    it "sets a new session token on the user" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_session_token)
    end

    it "returns new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end
end
