
require_relative '../spec_helper.rb'

describe 'Creating a new user' do

  context 'should allow user to be' do

    it 'valid if created with proper variables' do
      user = User.create(username: "tester", email: "tester@mail.com", password: "password", password_confirmation: "password" )
      expect(user).to be_valid
    end

    it 'invalid if created without a email' do
      user = User.create(username: "tester", password: "password", password_confirmation: "password" )
      expect(user).to be_invalid
    end

    it 'invalid if created without a password' do
      user = User.create(username: "tester", email: "tester@mail.com")
      expect(user).to be_invalid
    end

    it 'invalid if created without a password confirmation' do
      user = User.create(username: "tester", email: "tester@mail.com", password: 'password')
      expect(user).to be_invalid
    end

    it 'invalid if created without a username' do
      user = User.create(email: "tester@mail.com", password: "password", password_confirmation: "password" )
      expect(user).to be_invalid
    end

  end

end
