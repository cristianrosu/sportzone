class LocationPresenter < SimpleDelegator
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
