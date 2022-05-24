require 'rails_helper'

RSpec.describe Comment, type: :model do

  before(:each) do   
    @user = FactoryBot.create(:user) 
    @picture = Rack::Test::UploadedFile.new(Rails.root.join('/home/jeremy/Images/Batman_logo.png'), 'Batman_logo.png')
    @idea = FactoryBot.create(:idea, picture: @picture, user_id: @user.id )
    @comment = FactoryBot.create(:comment, idea_id: @idea.id, user_id: @user.id)
  end

  it "has a valid idea factory" do
    expect(@comment).to be_valid
  end

  context "validation of the comment model" do
    describe "validate the with all atributes" do
      it { should validate_presence_of(:user_name) }
      it { should validate_presence_of(:body) }
    end

    describe "validate if the body is too long or too short" do
      it { should_not allow_value(@comment.body = "f"*2).for(:body) }
      it { should_not allow_value(@comment.body = "f"*101).for(:body) }
    end
  end

  context "associations" do
    describe "belong to a user and a user" do
        it { should belong_to(:user) } 
        it { should belong_to(:idea) }        
    end
  end
end
