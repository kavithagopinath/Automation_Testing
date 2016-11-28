require 'byebug'
class SouthwestPageObjects
  include PageObject

  page_url "https://www.southwest.com/"

  text_field(:departure_location, name: 'originAirport')
  text_field(:arrival_location, name: 'destinationAirport')
  button(:search_button, id: 'jb-booking-form-submit-button')
  div(:search_from_date, class: 'js-depart-date-label booking-form--label booking-form--date-container-label')
  div(:search_to_date, class: 'js-return-date-label booking-form--label booking-form--date-container-label')

  def search_flights_based_on_location_with_default_date(departure_location,arrival_location)

    self.departure_location = departure_location
    self.arrival_location = arrival_location
    self.search_button

  end

  def check_if_default_from_date_is_same_in_result
    @browser.div(:id, 'carouselTodayDepart').text

  end

  def check_if_default_to_date_is_same_in_result
    @browser.div(:id, 'carouselTodayReturn').text


  end



  def check_if_dates_disabled_are_past
    $number_of_disabled_past_dates = 0
    @browser.lis(:class, 'carouselDisabled').each do |iterating_disabled_data|
      $disabled_date = iterating_disabled_data.div(:class, 'carouselBody').text
      if $disabled_date < (Date.today).strftime('%d') then
        $number_of_disabled_past_dates += 1
      end
    end
    $number_of_disabled_past_dates
  end

end