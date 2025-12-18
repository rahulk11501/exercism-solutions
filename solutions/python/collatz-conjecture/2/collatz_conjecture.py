def steps(n: int) -> int:
    """Return the number of steps to reach 1 using the Collatz process."""
    if n < 1:
        raise ValueError("Only positive integers are allowed")

    steps_count = 0

    while n != 1:
        n = n // 2 if n % 2 == 0 else n * 3 + 1
        steps_count += 1

    return steps_count
