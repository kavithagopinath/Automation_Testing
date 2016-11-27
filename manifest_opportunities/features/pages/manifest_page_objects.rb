class ManifestPageObjects
  include PageObject

  page_url "http://manifestcorp.com/opportunities/all-opportunities/"

  select(:select_location, name: 'opportunity_loc' )
  select(:select_type, name: 'opportunity_type')

  def on_opportunities_page_filter_based_on_location(select_location)
    self.select_location = select_location
  end

  def get_all_location_divs
    @browser.divs( :class => 'opp-loc' )
  end

  def on_opportunities_page_filter_based_on_type(select_type)
    self.select_type = select_type
  end

  def get_all_type_divs
    @browser.divs( :class => 'opp-type' )
  end
end


