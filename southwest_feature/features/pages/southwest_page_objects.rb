class SouthwestPageObjects
  include PageObject

  page_url "https://www.southwest.com/"

  text_field(:departure, name: 'originAirport')
  text_field(:arrival, name: 'destinationAirport')
  button(:search, id: 'jb-booking-form-submit-button')
  div(:search_from_date, class: 'js-depart-date-label booking-form--label booking-form--date-container-label')
  div(:search_to_date, class: 'js-return-date-label booking-form--label booking-form--date-container-label')

  def search_flights_based_on_location_with_default_date(departure,arrival)

    self.departure = departure
    self.arrival = arrival
    self.search
  end

  def check_if_default_from_date_is_same_in_result
    @browser.div(:id, 'carouselTodayDepart').text
  end

  def check_if_default_to_date_is_same_in_result
    @browser.div(:id, 'carouselTodayReturn').text

  end



  def check_if_dates_disabled_are_past
    $count = 0
    @browser.lis(:class, 'carouselDisabled').each do |iterating_data|
      $disabled_date = iterating_data.div(:class, 'carouselBody').text
      if $disabled_date < (Date.today).strftime('%d') then
        $count += 1
      end
    end
    $count
  end

end