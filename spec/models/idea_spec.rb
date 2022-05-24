require 'rails_helper'

RSpec.describe Idea do
    # Comments: testing model validations methods
    subject { Idea.new } 

    it "is not valid without a name, description and picture" do
        expect(subject).not_to be_valid
    end  

    it "is not valid if it has just a name" do
        subject.name = "Johnny"
        expect(subject).not_to be_valid
    end

    it "is not valid if it has just a description" do
        subject.description = "Johnny is a good testor"
        expect(subject).not_to be_valid
    end

    it "is not valid if it has just a picture" do
        subject.picture = "picture of Johnny"
        expect(subject).not_to be_valid
    end

    it "is not valid if description is less then 10 letters" do
        subject.name = "Johnny"
        subject.description = "J" * 9
        subject.picture = "picture of Johnny"
        expect(subject).not_to be_valid
    end

    it "is not valid if description is more then 100 letters" do
        subject.name = "Johnny"
        subject.description = "J" * 101
        subject.picture = "urltest"
        expect(subject).not_to be_valid
    end

    it "is valid if it has a name, a description that has more then 10 letters and less then 100, and a picture" do
        subject.name = "Johnny"
        subject.description = "Johnny is a good testor"
        subject.picture = "urltest"
        expect(subject).to be_valid
    end

    it "can replace a first data by a second one" do
        idea = Idea.create!(name: "My Awesome Idea Name", description: "Johnny is a good testor", picture:"urltest")  
        second_idea = Idea.create!(name: "My Second Idea Name") 
        expect(second_idea.name).to eq("My Second Idea Name") 
    end
end