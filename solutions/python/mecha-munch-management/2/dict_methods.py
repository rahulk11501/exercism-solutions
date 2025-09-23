"""Functions to manage a users shopping cart items."""


from typing import Dict, Tuple


def add_item(
    current_cart: Dict[str, int], 
    items_to_add: Tuple[str, ...]
) -> Dict[str, int]:
    """Add items to shopping cart.
    """
    for item in items_to_add:
        current_cart[item] = current_cart.get(item, 0) + 1
    return current_cart


def read_notes(
    notes: Tuple[str, ...]
) -> Dict[str, int]:
    """Create user cart from an iterable notes entry.
    """
    current_cart: Dict[str, int] = {}
    for item in notes:
        current_cart[item] = current_cart.get(item, 0) + 1
    return current_cart


def update_recipes(
    ideas: Dict[str, str], 
    recipe_updates: Tuple[Tuple[str, str], ...]
) -> Dict[str, str]:
    """Update the recipe ideas dictionary.
    """
    for key, value in recipe_updates:
        ideas[key] = value
    return ideas


def sort_entries(cart: Dict[str, int]) -> Dict[str, int]:
    """Sort a users shopping cart in alphabetically order.
    """
    return dict(sorted(cart.items()))


def send_to_store(
    cart: Dict[str, int], 
    aisle_mapping: Dict[str, Tuple[str, bool]]
) -> Dict[str, Tuple[int, str, bool]]:
    """Combine user's order with aisle and refrigeration info,
    sorted by item name in reverse alphabetical order.
    """
    orders: Dict[str, Tuple[int, str, bool]] = {}
    for item in sorted(cart.keys(), reverse=True):
        aisle, refrigerated = aisle_mapping[item]
        orders[item] = [cart[item], aisle, refrigerated]
    return orders


def update_store_inventory(
    fulfillment_cart: Dict[str, Tuple[int, ...]],
    store_inventory: Dict[str, Tuple[int, str, bool]]
) -> Dict[str, Tuple[int, str, bool]]:
    """Update store inventory levels with user order.
    """
    for key, cart_item in fulfillment_cart.items():
        store_item = store_inventory[key]
        stock = store_item[0] - cart_item[0]
        if stock == 0:
            stock = 'Out of Stock'
        store_inventory[key] = [stock, store_item[1], store_item[2]]
    return store_inventory
