require 'date'
require 'nokogiri'
When(/^I search for a flight using the default dates$/) do
 visit_page SouthwestPageObjects do |page|
   @search_from_date = Date.parse(page.search_from_date)
   @parsed_from_date = (@search_from_date).strftime('%B %d')
   @search_to_date = Date.parse(page.search_to_date)
   @parsed_to_date = (@search_to_date).strftime('%B %-d')
   page.search_flights_based_on_location_with_default_date(DEPARTURE_LOCATION, ARRIVAL_LOCATION)
   sleep 4

 end
end

Then(/^the dates I searched for are highlighted in the search results$/) do
  on_page SouthwestPageObjects do |page|
    expect(page.check_if_default_from_date_is_same_in_result).to include(@parsed_from_date)
    expect(page.check_if_default_to_date_is_same_in_result).to include(@parsed_to_date)

  end

end

And(/^I can't choose a departure date from past$/) do
  on_page SouthwestPageObjects do |page|
    expect(page.check_if_dates_disabled_are_past).to eq (5)

  end

end