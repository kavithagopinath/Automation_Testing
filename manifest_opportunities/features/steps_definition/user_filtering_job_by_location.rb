When(/^I filter jobs by Columbus$/) do
  visit_page ManifestPageObjects do |page|
    page.on_opportunities_page_filter_based_on_location(LOCATION)
    sleep 4

  end
end

Then(/^only Columbus oppurtunities are present$/) do
  on_page ManifestPageObjects do |page|
    all_location_div = page.get_all_location_divs
    all_location_div.each do |opportunity_location_div|
      expect(opportunity_location_div.text).to eq 'Columbus, OH'


    end
    end
end