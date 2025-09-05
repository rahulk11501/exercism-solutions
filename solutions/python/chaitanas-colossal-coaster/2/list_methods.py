"""Functions to manage and organize queues at Chaitana's roller coaster."""

from typing import List

def add_me_to_the_queue(
    express_queue: List[str],
    normal_queue: List[str],
    ticket_type: int,
    person_name: str
) -> List[str]:
    """Add a person to the 'express' or 'normal' queue depending on the ticket number."""
    selected_queue = express_queue if ticket_type == 1 else normal_queue
    return selected_queue + [person_name]


def find_my_friend(
    queue: List[str], 
    friend_name: str
) -> int:
    """Search the queue for a name and return their queue position (index)."""
    return queue.index(friend_name)


def add_me_with_my_friends(
    queue: List[str], 
    index: int, 
    person_name: str
) -> List[str]:
    """Insert the late arrival's name at a specific index of the queue."""
    queue.insert(index, person_name)
    return queue


def remove_the_mean_person(
    queue: List[str], 
    person_name: str
) -> List[str]:
    """Remove the mean person from the queue by the provided name."""
    queue.remove(person_name)
    return queue


def how_many_namefellows(
    queue: List[str], 
    person_name: str
) -> int:
    """Count how many times the provided name appears in the queue."""
    return queue.count(person_name)


def remove_the_last_person(
    queue: List[str]
) -> str:
    """Remove the person in the last index from the queue and return their name."""
    return queue.pop()


def sorted_names(
    queue: List[str]
) -> List[str]:
    """Sort the names in the queue in alphabetical order and return the result."""
    return sorted(queue)
