require 'rails_helper'

RSpec.describe Event, type: :model do
  context "that is just created" do
    it "has completed set to false" do
      user = User.create!(email: "test@gmail.com", password: "123456789")
      params = {"name"=>"test", "body"=>"body_test", "due_date(1i)"=>"2017", "due_date(2i)"=>"3", "due_date(3i)"=>"3", "due_date(4i)"=>"18", "due_date(5i)"=>"36"}
      event = user.events.create!(params)
      expect(event.completed).to eq(false)
    end

    it "is invalid without without a body" do
      # user = User.create!(email: "test@gmail.com", password: "123456789")
      # params = {"name"=>"test", "body"=>"body_test", "due_date(1i)"=>"2017", "due_date(2i)"=>"3", "due_date(3i)"=>"3", "due_date(4i)"=>"18", "due_date(5i)"=>"36"}
      # event = user.events.create!(params)
      # expect(event.completed).to eq(false)
    end

    it "is invalid without without a due date" do
      # user = User.create!(email: "test@gmail.com", password: "123456789")
      # params = {"name"=>"test", "body"=>"body_test", "due_date(1i)"=>"2017", "due_date(2i)"=>"3", "due_date(3i)"=>"3", "due_date(4i)"=>"18", "due_date(5i)"=>"36"}
      # event = user.events.create!(params)
      # expect(event.completed).to eq(false)
    end

  end
end
