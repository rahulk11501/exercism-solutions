"""Utility functions for calculating steps in exchanging currency.

Python numeric types:
https://docs.python.org/3/library/stdtypes.html#numeric-types-int-float-complex

Guide to exchanging currency when traveling:
https://www.compareremit.com/money-transfer-tips/guide-to-exchanging-currency-for-overseas-travel/
"""


def exchange_money(budget: float, exchange_rate: float, whole_number: bool = False) -> float:
    """
    Calculate the amount of foreign currency that can be received.

    Args:
        budget: Amount of money available to exchange.
        exchange_rate: Unit cost of the foreign currency.
        whole_number: Whether to return only whole units of foreign currency.

    Returns:
        The amount of foreign currency received.
    """
    result = budget / exchange_rate
    return result // 1 if whole_number else result


def get_change(budget: float, exchanging_value: float) -> float:
    """
    Calculate the remaining currency after making an exchange.

    Args:
        budget: Total amount of starting currency.
        exchanging_value: Amount being exchanged.

    Returns:
        The remaining amount of starting currency.
    """
    return budget - exchanging_value


def get_value_of_bills(denomination: int, number_of_bills: int) -> int:
    """
    Calculate the total value of a stack of bills.

    Args:
        denomination: Value of a single bill.
        number_of_bills: Number of bills.

    Returns:
        The total value of the bills.
    """
    return denomination * number_of_bills


def get_number_of_bills(amount: float, denomination: int) -> int:
    """
    Determine how many whole bills can be obtained from a given amount.

    Args:
        amount: Total amount available.
        denomination: Value of one bill.

    Returns:
        Number of whole bills obtainable.
    """
    return int(amount // denomination)


def get_leftover_of_bills(amount: float, denomination: int) -> float:
    """
    Determine the leftover amount when breaking money into bills.

    Args:
        amount: Total starting amount.
        denomination: Value of a single bill.

    Returns:
        The leftover amount not forming a whole bill.
    """
    return amount % denomination


def exchangeable_value(budget: float, exchange_rate: float, spread: int, denomination: int) -> int:
    """
    Calculate the maximum exchangeable value in whole bills.

    Args:
        budget: Amount of money available to exchange.
        exchange_rate: Unit cost of the foreign currency.
        spread: Percentage fee added to the exchange rate.
        denomination: Value of a single bill in the foreign currency.

    Returns:
        Maximum exchangeable value in whole bills.
    """
    # Adjust rate with fee
    adjusted_rate = exchange_rate * (1 + spread / 100)

    # Total foreign currency after applying fees
    converted_amount = budget / adjusted_rate

    # Number of whole bills obtainable
    bill_count = int(converted_amount // denomination)

    return bill_count * denomination
