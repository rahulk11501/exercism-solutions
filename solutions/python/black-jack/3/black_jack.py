"""Functions to help play and score a game of blackjack.

How to play blackjack:    https://bicyclecards.com/how-to-play/blackjack/
"Standard" playing cards: https://en.wikipedia.org/wiki/Standard_52-card_deck
"""

from typing import Tuple, Union

FACE_CARDS = {"J", "Q", "K"}


def value_of_card(card: str) -> int:
    """Return the blackjack value of a single card."""
    if card in FACE_CARDS:
        return 10
    if card == "A":
        return 1
    return int(card)


def higher_card(card_one: str, card_two: str) -> Union[str, Tuple[str, str]]:
    """Return the higher-value card or both if tied."""
    value_one = value_of_card(card_one)
    value_two = value_of_card(card_two)

    if value_one == value_two:
        return card_one, card_two

    return card_one if value_one > value_two else card_two


def value_of_ace(card_one: str, card_two: str) -> int:
    """Return the optimal value (1 or 11) for a new ace."""
    if "A" in (card_one, card_two):
        return 1

    hand_total = value_of_card(card_one) + value_of_card(card_two)
    return 11 if hand_total + 11 <= 21 else 1


def is_blackjack(card_one: str, card_two: str) -> bool:
    """Return True if the hand is a natural blackjack."""
    if card_one == "A":
        return 11 + value_of_card(card_two) == 21
    if card_two == "A":
        return 11 + value_of_card(card_one) == 21

    return value_of_card(card_one) + value_of_card(card_two) == 21


def can_split_pairs(card_one: str, card_two: str) -> bool:
    """Return True if the cards can be split into pairs."""
    return value_of_card(card_one) == value_of_card(card_two)


def can_double_down(card_one: str, card_two: str) -> bool:
    """Return True if the hand total allows doubling down."""
    total = value_of_card(card_one) + value_of_card(card_two)
    return total in {9, 10, 11}
