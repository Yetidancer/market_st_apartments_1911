class Apartment

  attr_reader :info, :number, :monthly_rent, :bathrooms, :bedrooms, :renter
  def initialize(info)
    @info = info
    @number = info[:number]
    @monthly_rent = info[:monthly_rent]
    @bathrooms = info[:bathrooms]
    @bedrooms = info[:bedrooms]
    @renter = nil
  end

  def add_renter(renter)
    @renter = renter
  end

end
