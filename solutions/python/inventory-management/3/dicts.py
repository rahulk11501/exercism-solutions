"""Functions to keep track of and modify inventory."""

from typing import Dict, List, Tuple
from collections import Counter


def create_inventory(items: List[str]) -> Dict[str, int]:
    """Create an inventory dictionary counting each item in the list."""
    return dict(Counter(items))


def add_items(
    inventory: Dict[str, int],
    items: List[str]
) -> Dict[str, int]:
    """Add or increment items in the inventory."""
    for item in items:
        inventory[item] = inventory.get(item, 0) + 1
    return inventory


def decrement_items(
    inventory: Dict[str, int],
    items: List[str]
) -> Dict[str, int]:
    """Decrement item counts in the inventory without going below zero."""
    for item in items:
        if inventory.get(item, 0) > 0:
            inventory[item] -= 1
    return inventory


def remove_item(
    inventory: Dict[str, int],
    item: str
) -> Dict[str, int]:
    """Remove an item entirely from the inventory."""
    inventory.pop(item, None)
    return inventory


def list_inventory(
    inventory: Dict[str, int]
) -> List[Tuple[str, int]]:
    """Return a list of (item, count) pairs for items with a positive count."""
    return [(item, count) for item, count in inventory.items() if count > 0]
