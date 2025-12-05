"""
Utility functions for preparing Guido's gorgeous lasagna.

Learn about Guido van Rossum, the creator of Python:
https://en.wikipedia.org/wiki/Guido_van_Rossum
"""

EXPECTED_BAKE_TIME: int = 40
PREPARATION_TIME: int = 2


def bake_time_remaining(elapsed_bake_time: int) -> int:
    """
    Return the remaining bake time.

    Args:
        elapsed_bake_time: Minutes the lasagna has already baked.

    Returns:
        Remaining bake time based on `EXPECTED_BAKE_TIME`.
    """
    return EXPECTED_BAKE_TIME - elapsed_bake_time


def preparation_time_in_minutes(number_of_layers: int) -> int:
    """
    Return the total preparation time.

    Args:
        number_of_layers: Number of layers in the lasagna.

    Returns:
        Preparation time in minutes (2 minutes per layer).
    """
    return PREPARATION_TIME * number_of_layers


def elapsed_time_in_minutes(number_of_layers: int, elapsed_bake_time: int) -> int:
    """
    Return total time spent preparing and baking the lasagna.

    Args:
        number_of_layers: Number of layers in the lasagna.
        elapsed_bake_time: Minutes the lasagna has already baked.

    Returns:
        Total elapsed time in minutes.
    """
    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
