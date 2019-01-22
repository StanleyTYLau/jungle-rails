require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "pwd and pwd confirmation match" do
      user1 = User.new({
        password: "aaaaaaaa",
        password_confirmation: "aaaaaaaa"
      })

      expect(user1).to be_valid
    end

    it "pwd and pwd confirmation do not match is not valid" do
      user1 = User.new({
        password: "12345678",
        password_confirmation: "88888888"
      })

      expect(user1).to_not be_valid
    end

    it "user emails must be unique" do
      user1 = User.new(
        email: "abc@abc.com",
        password: "aaaaaaaaa",
        password_confirmation: "aaaaaaaaa"
      )
      user1.save

      user2 = User.new(
        email: "abc@abc.com",
        password: "aaaaaaaaa",
        password_confirmation: "aaaaaaaaa"
      )
      user2.save

      expect(user2.errors.get(:email)).to eq(["has already been taken"])
    end

    it "password must be 8 char long" do
      user1 = User.new({
        password: "1234567",
        password_confirmation: "1234567"
      })

      expect(user1).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    it "Successfully login user" do
      
      @user1 = User.create!(
        email: "abc@abc.com",
        password: "123456789",
        password_confirmation: "123456789",
        firstname: "stan",
        lastname: "bob"
      )
      puts @user1.errors.full_messages
      

      @user20 = User.authenticate_with_credentials("abc@abc.com", "123456789")
      puts @user20.errors.full_messages

      expect(@user20).to_not be_nil
      
    end
  end
end
