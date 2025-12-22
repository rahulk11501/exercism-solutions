MIN_SQUARE = 1
MAX_SQUARE = 64

def square(number):
    if not MIN_SQUARE <= number <= MAX_SQUARE:
        raise ValueError(f"square must be between {MIN_SQUARE} and {MAX_SQUARE}")
    return 1 << (number - 1)  # same as 2**(number - 1)


def total():
    # Sum of grains on all 64 squares
    return (1 << MAX_SQUARE) - 1
