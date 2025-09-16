"""Functions to keep track and alter inventory."""

from typing import List, Dict, Tuple
def create_inventory(
    items: List[str]
) -> Dict[str, int]:
    """Create a dict that tracks the amount (count) of each element on the `items` list.
    """
    return {item: items.count(item) for item in items}

def add_items(
    inventory: Dict[str, int],
    items: List[str]
) -> Dict[str, int]:
    """Add or increment items in inventory using elements from the items `list`.
    """
    for item in items:
        inventory[item] = inventory.get(item, 0) + 1
    return inventory


def decrement_items(
    inventory: Dict[str, int],
    items: List[str]
) -> Dict[str, int]:
    """Decrement items in inventory using elements from the `items` list.
    """
    for item in items:
        if item in inventory and inventory[item] > 0:
            inventory[item] -= 1  
    return inventory


def remove_item(
    inventory: Dict[str, int],
    item: str
) -> Dict[str, int]:
    """Remove item from inventory if it matches `item` string.
    """
    inventory.pop(item, None)
    return inventory


def list_inventory(
    inventory: Dict[str, int]
) -> List[Tuple[str, int]]:
    """Create a list containing only available (item_name, item_count > 0) pairs in inventory.
    """
    return [(item, val) for item, val in inventory.items() if val!=0]