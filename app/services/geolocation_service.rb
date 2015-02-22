class GeolocationService
  def initialize(search_string)
    @search_string = search_string
  end

  ## Get location requested by user through the search form
  #  or default to Cluj
  def location
    LocationPresenter.new(
      Geocoder.search(search_string).first,
      search_string
    )
  end

  def search_string
    @str ||= if @search_string.blank?
      'Cluj'
    else
      @search_string
    end
  end
end
