require 'rails_helper'

describe 'Login API' do
  describe 'happy paths' do
    it 'can ensure a user is authenticated with JWT' do
      user = User.create(email: 'sample.coach@mobile.edu', password: 'samplepassword')

      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      }

      body = {
        email: user.email.to_s,
        password: user.password.to_s,
      }

      post '/api/v0/login', headers: headers, params: JSON.generate(body)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      parsed = JSON.parse(response.body, symbolize_names: true)
      # I want an auth_token key and a message key
      # I want auth_token key to_not be empty
      require "pry"; binding.pry
    end

    it 'logs in with case insenitive email check'
  end
  describe 'sad path' do
    it "won't log in a user with bad credentials"
      # user create
      # post
      # expect response to not be successful
      # expect 401
      # expect keys data and message
      # expect message set to Invalid user credentials
  end
end