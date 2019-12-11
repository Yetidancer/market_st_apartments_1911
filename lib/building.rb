class Building

  attr_reader :units
  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    x = 0.0
    units.map {|unit| x += unit.monthly_rent}
    x / units.length
  end

  def renter_with_highest_rent
    occupied_units = []

    rents = []

    units.each do |unit|
      if unit.renter != nil
        occupied_units << unit
      end
    end

    occupied_units.each do |unit|
      rents << unit.monthly_rent
    end

    highest_rent = rents.sort.last

    units.each do |unit|
      return unit.renter if unit.monthly_rent == highest_rent
    end
  end

  def annual_breakdown
    occupied_units = []
    yearly_rents = []
    occupied_units_renter_names = []

    units.each do |unit|
      if unit.renter != nil
        occupied_units << unit
      end
    end

    occupied_units.each {|unit| yearly_rents << (unit.monthly_rent * 12)}

    occupied_units.each {|unit| occupied_units_renter_names << unit.renter.name}

    sliced_values = yearly_rents.each_slice(occupied_units_renter_names.length)

    annual_breakdown = sliced_values.map { |slice| occupied_units_renter_names.zip(slice).to_h }

    annual_breakdown[0]
  end
end
