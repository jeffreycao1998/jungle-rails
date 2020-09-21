require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Validations' do
    context 'given only password' do
      it "gives an error saying password_confirmation can't be blank" do
        user = User.new(first_name: 'Scott',)
      end
    end

    context 'given only password_confirmation' do
      it "gives an error saying password can't be blank" do
        
      end
    end

    context 'given unmatching password and password_confirmations' do
      it "gives an error saying password_confirmation can't be blank" do
        
      end
    end
  end
end
