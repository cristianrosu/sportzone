class LocationPresenter < SimpleDelegator
  attr_reader :search_string

  def initialize(obj, search_string)
    @search_string = search_string
    super(obj)
  end

  def top
    northeast['lat']
  end

  def right
    northeast['lng']
  end

  def bottom
    southwest['lat']
  end

  def left
    southwest['lng']
  end

  def to_hash
    {
      latitude: latitude,
      longitude: longitude,
      top: top,
      right: right,
      bottom: bottom,
      left: left,
    }
  end

  private

    def northeast
      viewport['northeast']
    end

    def southwest
      viewport['southwest']
    end

    def viewport
      geometry['viewport']
    end
end
