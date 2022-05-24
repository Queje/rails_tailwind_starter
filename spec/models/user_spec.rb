require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @user = FactoryBot.create(:user)    
  end

  it "has a valid user factory" do
    expect(build(:user)).to be_valid
  end

  context "validation of devise" do
    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end

    describe "test a fake email not to check devise" do
      it { should_not allow_value(@user.email = "fakeemail" ).for(:email) }  
    end

    describe "test a fake password with less than 6 letters to check devise" do
      it { should_not allow_value(@user.password = "f"*5).for(:password) }  
    end

    describe "test a fake password with more than 128 letters to check devise" do
      it { should_not allow_value(@user.password = "f"*129).for(:password) }  
    end
  end

  context "asssociation" do
    describe "has many ideas and many comments" do
      it { should have_many(:ideas)}
      it { should have_many(:comments)}
    end
  end
end
