"""Functions to manage a users shopping cart items."""


def add_item(current_cart: dict, items_to_add: tuple) -> dict:
    """Add items to shopping cart.
    """
    for item in items_to_add:
        current_cart[item] = current_cart.get(item, 0) + 1
    return current_cart

def read_notes(notes: tuple) -> dict:
    """Create user cart from an iterable notes entry.
    """
    current_cart = {}
    for item in notes:
        current_cart[item] = current_cart.get(item, 0) + 1
    return current_cart


def update_recipes(ideas: dict, recipe_updates: tuple) -> dict:
    """Update the recipe ideas dictionary.
    """
    for key, value in recipe_updates:
        ideas[key] = value
    return ideas

def sort_entries(cart: dict) -> dict:
    """Sort a users shopping cart in alphabetically order.
    """
    return dict(sorted(cart.items()))


def send_to_store(cart: dict, aisle_mapping: dict) -> dict:
    """Combine user's order with aisle and refrigeration info,
    sorted by item name in reverse alphabetical order.
    """
    orders = {}
    for item in sorted(cart.keys(), reverse=True):
        aisle, refrigerated = aisle_mapping[item]
        orders[item] = [cart[item], aisle, refrigerated]
    return orders



def update_store_inventory(fulfillment_cart: dict, store_inventory: dict) -> dict:
    """Update store inventory levels with user order.
    """
    for key, cart_item in fulfillment_cart.items():
        store_item = store_inventory[key]
        stock = store_item[0] - cart_item[0]
        if stock == 0:
            stock = 'Out of Stock'
        store_inventory[key] = [stock, store_item[1], store_item[2]]
    return store_inventory
