require 'rails_helper'

RSpec.describe "All routes", :type => :request do

    # to test controller response without user actions, it makes more sense to test more of theses in feature tests

    before(:each) do   
        @user = FactoryBot.create(:user) 
        @picture = Rack::Test::UploadedFile.new(Rails.root.join('/home/jeremy/Images/Batman_logo.png'), 'Batman_logo.png')
        @idea = FactoryBot.create(:idea, picture: @picture, user_id: @user.id )
        @comment = FactoryBot.create(:comment, idea_id: @idea.id, user_id: @user.id)
    end

    it "asks for the root page" do
        get "/"
        expect(response).to render_template(:index)
        expect(response.status).to eq(200)
    end

    it 'shows the title on the index page in an h1 tag' do
        visit "/"
        expect(page).to have_css("h1", text: "Welcome to the Posts!")
    end

    it "asks for a show page" do
        get "/ideas/#{@idea.id}"
        expect(response).to render_template(:show)
        expect(response.status).to eq(200) 
    end

    it "shows the title on the index page in an h1 tag" do
        visit "/ideas/#{@idea.id}"
        expect(page).to have_css("h1", text: "#{@idea.name} has posted")
    end
end