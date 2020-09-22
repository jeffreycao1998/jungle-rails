require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Validations' do
    it 'succesfully saves if given valid inputs' do
      user = User.new(email:'jeffcao1998@hotmail.com', password:'123', password_confirmation:'123')
      expect(user).to be_valid
    end

    it 'gives error if password & password confirmation do not match' do
      user = User.new(email:'jeffcao1998@hotmail.com', password:'123', password_confirmation:'1223')
      user.save
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'gives error if email is already in database' do
      user = User.new(email:'jeffcao1998@hotmail.com', password:'123', password_confirmation:'123')
      user.save

      user1 = User.new(email:'JEFFcao1998@hotmail.com', password:'123', password_confirmation:'123')
      user1.save

      expect(user1.errors.full_messages).to include("Email has already been taken")
    end

    it "gives error if email is blank" do
      user = User.new(password:'123', password_confirmation:'123')
      user.save

      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "gives error if password is blank" do
      user = User.new(email:'JEFFcao1998@hotmail.com', password_confirmation:'123')
      user.save

      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it "gives error if password_confirmation is blank" do
      user = User.new(email:'JEFFcao1998@hotmail.com', password:'123')
      user.save

      expect(user.errors.full_messages).to include("Password confirmation can't be blank")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'returns user if login successful' do
      user = User.new(email: 'jeffrey789', password: '123', password_confirmation: '123')
      user.save

      expect(User.authenticate_with_credentials('jeffrey789', '123')[0]).to eq(User.find_by(email: 'jeffrey789'))
    end
  end
end
