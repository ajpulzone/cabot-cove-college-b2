require "rails_helper"

RSpec.describe "resident show page", type: :feature do

  before(:each) do
    @resident1 = Resident.create!(name: "Jessica Fletcher", age: 65, occupation: "Mystery Writer")
    @resident2 = Resident.create!(name: "Dr. Seth Hazlitt", age: 70, occupation: "Town Doctor")
  end


  it " shows a list of residents. The list includes the residents' name, age and occupation" do

    visit "/residents"

    within("#resident-#{@resident1.id}") do
      expect(page).to have_content("Jessica Fletcher")
      expect(page).to have_content(65)
      expect(page).to have_content("Mystery Writer")
    end

    within("#resident-#{@resident2.id}") do
      expect(page).to have_content("Dr. Seth Hazlitt")
      expect(page).to have_content(70)
      expect(page).to have_content("Town Doctor")
    end
  end 
end