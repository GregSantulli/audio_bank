require 'spec_helper'

describe "POST /auth" do

  context "with valid email, password, and passowrd_confirmation" do

    before(:each) do
      @email = "vaid@email.com"
      @password = "validpassword"
    end

    it "creates a new user" do
      post "/auth", email: @email, password: @password, password_confirmation: @password
        json = JSON.parse(response.body)
      header = response.header
      binding.pry

      expect(header['access-token']).to be
      expect(response.code).to eq("200")
      expect(json['data']['email']).to eq(@email)
    end

  end

  context "without valid email, password, and passowrd_confirmation" do

    it "requires a password" do
      post "/auth", email: "weee@eee.com"
      json = JSON.parse(response.body)
      header = response.header
      expect(header['access-token']).to_not be
      expect(response.code).to eq("422")
      expect(json['errors']).to be
    end

    it "requires a password_confirmation to match" do
      post "/auth", email: "weee@eee.com", password: "password", password_confirmation: "sddwdwdw"
      json = JSON.parse(response.body)
      expect(response.code).to eq("422")
      expect(json['errors']['password_confirmation']).to be
    end

  end

end

describe "POST /auth/sign_in" do


  context "with valid credentials" do

    before(:each) do
      @email = "vaid@email.com"
      @password = "password"
      @user = User.create!(email: @email, password: @password)
    end

    it "signs in a user" do
      post "/auth/sign_in", email: @email, password: @password, password_confirmation: @password
      post "/auth/sign_in", email: @email, password: @password, password_confirmation: @password
      post "/auth/sign_in", email: @email, password: @password, password_confirmation: @password

      json = JSON.parse(response.body)
      p header = response.header
      new_header = {
      "access-token" => headers['access-token'],
      "token-type" =>   headers["Bearer"],
      "client" =>       headers["client"],
      "expiry" =>       headers["expiry"],
      "uid" =>          headers["uid"]
        }

      binding.pry
      get "/api/v1/records", nil, new_header
      p json = JSON.parse(response.body)

      # binding.pry

      # expect(header['access-token']).to be
      # expect(response.code).to eq("200")
      # expect(json['data']['email']).to eq(@email)
    end

  end

end