"""Functions for tracking poker hands and assorted card tasks.

Python list documentation: https://docs.python.org/3/tutorial/datastructures.html
"""


def get_rounds(num: int) -> list:
    """Create a list containing the current and next two round numbers.

    :param number: int - current round number.
    :return: list - current round and the two that follow.
    """
    return [num, num+1, num+2]


def concatenate_rounds(rounds_1: list, rounds_2 :list) -> list:
    """Concatenate two lists of round numbers.

    :param rounds_1: list - first rounds played.
    :param rounds_2: list - second set of rounds played.
    :return: list - all rounds played.
    """

    return rounds_1 + rounds_2


def list_contains_round(rounds: list, number: int) -> bool:
    """Check if the list of rounds contains the specified number.

    :param rounds: list - rounds played.
    :param number: int - round number.
    :return: bool - was the round played?
    """

    return number in rounds


def card_average(hand: list) -> float:
    """Calculate and returns the average card value from the list.

    :param hand: list - cards in hand.
    :return: float - average value of the cards in the hand.
    """

    return sum(hand)/len(hand)


def approx_average_is_average(hand: list) -> bool:
    """Return if the (average of first and last card values) OR ('middle' card) == calculated average.

    :param hand: list - cards in hand.
    :return: bool - does one of the approximate averages equal the `true average`?
    """

    avg1 = (hand[0] + hand[-1])/2
    avg2 = card_average(hand)
    middle = len(hand) // 2
    return (avg1 == avg2) or (hand[middle]==avg2)


def average_even_is_average_odd(hand):
    """Return if the (average of even indexed card values) == (average of odd indexed card values).

    :param hand: list - cards in hand.
    :return: bool - are even and odd averages equal?
    """
    if not hand:  # empty hand → trivially equal
        return True  

    even_sum = even_count = 0
    odd_sum = odd_count = 0

    for i, value in enumerate(hand):
        if i % 2 == 0:
            even_sum += value
            even_count += 1
        else:
            odd_sum += value
            odd_count += 1

    even_avg = even_sum / even_count
    odd_avg = odd_sum / odd_count if odd_count else 0

    return even_avg == odd_avg



def maybe_double_last(hand: list) -> list:
    """Multiply a Jack card value in the last index position by 2.

    :param hand: list - cards in hand.
    :return: list - hand with Jacks (if present) value doubled.
    """

    if hand and hand[-1] == 11:
        hand[-1] *= 2
    return hand
