"""Functions which helps the locomotive engineer to keep track of the train."""


def get_list_of_wagons(*args) -> list:
    """Return a list of wagons.
    """
    return list(args)


def fix_list_of_wagons(each_wagons_id, missing_wagons):
    """Fix the list of wagons.
    """
    locomotive_id = 1
    locomotive_index = each_wagons_id.index(locomotive_id)
    left, right = each_wagons_id[:locomotive_index], each_wagons_id[locomotive_index+1: ]
    return [locomotive_id, *missing_wagons, *right, *left]

def add_missing_stops(routes, **kwargs):
    """Add missing stops to route dict.
    """
    routes['stops'] = list(kwargs.values())
    return routes


def extend_route_information(route, more_route_information):
    """Extend route information with more_route_information.
    """
    return {**route, **more_route_information}


def fix_wagon_depot(wagons_rows):
    """Fix the list of rows of wagons.
    """
    return [list(row) for row in zip(*wagons_rows)]
