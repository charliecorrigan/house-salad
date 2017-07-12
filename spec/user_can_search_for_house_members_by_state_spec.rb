require 'rails_helper'

feature "user can search for house members by state" do
  context "they select a state from the dropdown" do
    it "they see the search results displayed on results page" do
      visit root_path
      select 'Colorado', from: "state"
      click_on "Locate Members of the House"

      expect(current_path).to eq(search_path)
      expect(page).to have_content("7 Results")
      expect(page).to have_selector(".display-result", count: 7)
      within first(".display-result") do
        expect(page).to have_selector(".display-name")
        expect(page).to have_selector(".display-role")
        expect(page).to have_selector(".display-party")
        expect(page).to have_selector(".display-district")
      end
    end
  end
end

# Then my path should be "/search" with "state=CO" in the parameters
# And they should be ordered by seniority from most to least