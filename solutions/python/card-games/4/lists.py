"""Functions for tracking poker hands and assorted card tasks."""


def get_rounds(number: int) -> list[int]:
    """Return the current round number and the next two rounds."""
    return list(range(number, number + 3))


def concatenate_rounds(rounds_1: list[int], rounds_2: list[int]) -> list[int]:
    """Concatenate two lists of round numbers."""
    return rounds_1 + rounds_2


def list_contains_round(rounds: list[int], number: int) -> bool:
    """Check whether a specific round number is in the list."""
    return number in rounds


def card_average(hand: list[int]) -> float:
    """Return the average value of cards in the hand.

    Returns 0.0 if the hand is empty.
    """
    return sum(hand) / len(hand) if hand else 0.0


def approx_average_is_average(hand: list[int]) -> bool:
    """Check if an approximate average equals the true average.

    Approximate averages:
    - Average of first and last card
    - Middle card value
    """
    if not hand:
        return False

    true_avg = card_average(hand)
    end_avg = (hand[0] + hand[-1]) / 2
    middle_card = hand[len(hand) // 2]

    return true_avg in (end_avg, middle_card)


def average_even_is_average_odd(hand: list[int]) -> bool:
    """Check whether the average of even-indexed cards equals that of odd-indexed cards."""
    if len(hand) < 2:
        return False

    even_cards = hand[::2]
    odd_cards = hand[1::2]

    return (
        sum(even_cards) / len(even_cards)
        == sum(odd_cards) / len(odd_cards)
    )


def maybe_double_last(hand: list[int]) -> list[int]:
    """Double the value of the last card if it is a Jack (11)."""
    if not hand or hand[-1] != 11:
        return hand.copy()

    doubled_hand = hand.copy()
    doubled_hand[-1] *= 2
    return doubled_hand
