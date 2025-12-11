"""Utility functions for calculating steps in exchanging currency."""


def exchange_money(budget: float, exchange_rate: float, whole_number: bool = False) -> float:
    """Return the amount of foreign currency received.

    Parameters:
        budget (float): Amount of starting currency.
        exchange_rate (float): Unit cost of the foreign currency.
        whole_number (bool): Whether to return only whole units.

    Returns:
        float: Amount of foreign currency received.
    """
    amount = budget / exchange_rate
    return amount // 1 if whole_number else amount


def get_change(budget: float, exchanging_value: float) -> float:
    """Return the remaining currency after making an exchange."""
    return budget - exchanging_value


def get_value_of_bills(denomination: int, number_of_bills: int) -> int:
    """Return the total value of a number of bills."""
    return denomination * number_of_bills


def get_number_of_bills(amount: float, denomination: int) -> int:
    """Return how many whole bills can be taken from an amount."""
    return int(amount // denomination)


def get_leftover_of_bills(amount: float, denomination: int) -> float:
    """Return remaining amount after removing whole bills."""
    return amount % denomination


def exchangeable_value(budget: float, exchange_rate: float, spread: int, denomination: int) -> int:
    """Return the maximum exchangeable value in whole bills.

    Parameters:
        budget (float): Amount of starting currency.
        exchange_rate (float): Cost of the foreign currency per unit.
        spread (int): Fee percentage added to the exchange rate.
        denomination (int): Value of one bill of the foreign currency.

    Returns:
        int: Maximum value that can be exchanged in whole bills.
    """
    adjusted_rate = exchange_rate * (1 + spread / 100)
    converted_amount = budget / adjusted_rate
    bill_count = int(converted_amount // denomination)

    return bill_count * denomination
