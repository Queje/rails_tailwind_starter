require 'rails_helper'

RSpec.describe Idea, type: :model do

    before(:each) do   
        @user = FactoryBot.create(:user) 
        @picture = Rack::Test::UploadedFile.new(Rails.root.join('/home/jeremy/Images/Batman_logo.png'), 'Batman_logo.png')
        @idea = FactoryBot.create(:idea, picture: @picture, user_id: @user.id )
    end

    it "has a valid idea factory" do
        expect(@idea).to be_valid
    end

    context "validation of the idea model" do

        subject { @idea } 

        describe "validate the with all atributes" do
            it { should validate_presence_of(:name) }
            it { should validate_presence_of(:description) }
            it { should validate_presence_of(:picture) }
        end

        describe "when the description is to long or to short" do
            it { should_not allow_value(@idea.description = "f"*9).for(:description) }
            it { should_not allow_value(@idea.description = "f"*101).for(:description) }
        end
    end

    context "associations" do
        describe "belong to a user and had many comments" do
            it { should belong_to(:user) } 
            it { should have_many(:comments)}        
        end
    end
end