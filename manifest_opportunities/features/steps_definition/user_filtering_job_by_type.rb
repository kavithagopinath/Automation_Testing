When(/^I filter jobs by contract$/) do
  visit_page ManifestPageObjects do |page|
    page.on_opportunities_page_filter_based_on_type(TYPE)
    sleep 4

    end
end
Then(/^only contract opportunities are present$/) do
  on_page ManifestPageObjects do |page|
    all_type_div = page.get_all_type_divs
    all_type_div.each do |opportunity_type_div|
      expect(opportunity_type_div.text).to eq 'Contract'
    end
  end
  end
