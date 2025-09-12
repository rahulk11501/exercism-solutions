"""Functions to help Azara and Rui locate pirate treasure."""


def get_coordinate(record: tuple) -> str:
    """Return coordinate value from a tuple containing the treasure name, and treasure coordinate.
    """
    return record[1]
    


def convert_coordinate(coordinate: str) -> tuple:
    """Split the given coordinate into tuple containing its individual components.
    """
    return tuple(coordinate)


def compare_records(azara_record: tuple, rui_record: tuple) -> bool:
    """Compare two record types and determine if their coordinates match.
    """
    return tuple(azara_record[1]) == rui_record[1]


def create_record(azara_record: tuple, rui_record: tuple) -> tuple | str:
    """Combine the two record types (if possible) and create a combined record group.
    """
    if compare_records(azara_record, rui_record):
        return azara_record + rui_record
    else:
        return 'not a match'


def clean_up(combined_record_group: tuple) -> str:
    """Clean up a combined record group into a multi-line string of single records.
    """
    output = ""
    for record in combined_record_group:
        record = (record[0], record[2], record[3], record[4])
        output = output + str(record)+ "\n"
    return output