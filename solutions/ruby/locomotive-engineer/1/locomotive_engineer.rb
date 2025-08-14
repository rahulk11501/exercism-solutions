class LocomotiveEngineer
  def self.generate_list_of_wagons(*args)
    args
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    # Step 1: Move the first two items to the end
    reordered = each_wagons_id[2..] + each_wagons_id[0, 2]
  
    # Step 2: Insert missing wagons after the locomotive (1)
    loco_index = reordered.index(1)
    reordered.insert(loco_index + 1, *missing_wagons)
  
    reordered
  end


  def self.add_missing_stops(route, **stops)
    # Extract stop names in order of their keys
    ordered_stops = stops.sort_by { |key, _| key.to_s }.map { |_, city| city }
  
    # Return updated route hash
    route.merge(stops: ordered_stops)
  end


  def self.extend_route_information(route, more_route_information)
    route.merge(more_route_information)
  end
end
