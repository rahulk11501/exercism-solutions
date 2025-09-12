from typing import Tuple, Union, List


def get_coordinate(record: Tuple[str, str]) -> str:
    """Return coordinate value from a tuple containing the treasure name, and treasure coordinate."""
    return record[1]


def convert_coordinate(coordinate: str) -> Tuple[str, ...]:
    """Split the given coordinate into tuple containing its individual components."""
    return tuple(coordinate)


def compare_records(
    azara_record: Tuple[str, str],
    rui_record: Tuple[str, Tuple[str, str], str]
) -> bool:
    """Compare two record types and determine if their coordinates match."""
    return tuple(azara_record[1]) == rui_record[1]


def create_record(
    azara_record: Tuple[str, str],
    rui_record: Tuple[str, Tuple[str, str], str]
) -> Union[Tuple[str, str, str, Tuple[str, str], str], str]:
    """Combine the two record types (if possible) and create a combined record group."""
    if compare_records(azara_record, rui_record):
        return azara_record + rui_record
    return "not a match"


def clean_up(combined_record_group: Tuple[Tuple[str, str, str, Tuple[str, str], str], ...]) -> str:
    """Clean up a combined record group into a multi-line string of single records."""
    output = ""
    for record in combined_record_group:
        record = (record[0], record[2], record[3], record[4])
        output = output + str(record) + "\n"
    return output
