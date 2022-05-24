require 'rails_helper'

RSpec.feature "Ideas" do

    before(:each) do   
        @user = FactoryBot.create(:user) 
        @picture = Rack::Test::UploadedFile.new(Rails.root.join('/home/jeremy/Images/Batman_logo.png'), 'Batman_logo.png')
        @idea = FactoryBot.create(:idea, picture: @picture, user_id: @user.id )
        @comment = FactoryBot.create(:comment, idea_id: @idea.id, user_id: @user.id)
    end

    scenario "unlogged user wants to see a posted idea" do
        visit '/'
        click_link 'see this post!'
        expect(page).to have_css("h1", text: "#{@idea.name} has posted")
    end

    scenario "user wants to login" do
        visit'/'
        click_link 'Login'
        fill_in "user_email",	with: @user.email
        fill_in "user_password",	with: @user.password
        find('.actions>input').set("text\n") #to type enter and submit the form
        expect(status_code).to eq(200)    
    end

    scenario "logged in user wants to post" do
        login_as(@user)
        visit'/ideas/new'
        expect(status_code).to eq(200)
        # page.attach_file('idea_picture', Rails.root.join('/home/jeremy/Images/Batman_logo.png'), make_visible: true)
        # fill_in "idea_name",	with: Faker::Movies::HarryPotter.character
        # fill_in "idea_description",	with: Faker::Movies::HarryPotter.spell
        # click_button 'Create Idea' 
        # expect(response).to  
    end
end