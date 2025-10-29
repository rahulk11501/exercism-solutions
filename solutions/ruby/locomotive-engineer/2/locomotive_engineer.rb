class LocomotiveEngineer
  def self.generate_list_of_wagons(*args) 
    args
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    misplaced_1, misplaced_2, locomotive, *other_wagons = each_wagons_id
    [locomotive, *missing_wagons, *other_wagons, misplaced_1, misplaced_2]
  end

  def self.add_missing_stops(route, **stops)
    {**route, stops: stops.values}
  end


  def self.extend_route_information(route, more_route_information)
    route.merge(more_route_information)
  end

  ## Alternate implementation - 
  # def self.extend_route_information(route, more_route_information)
  #   {**route, **more_route_information}
  # end
end
