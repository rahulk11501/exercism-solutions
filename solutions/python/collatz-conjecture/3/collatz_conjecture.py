def steps(n: int) -> int:
    """Return the number of steps to reach 1 using the Collatz process."""
    if n <= 0:
        raise ValueError("Only positive integers are allowed")

    count = 0
    while n != 1:
        if n % 2 == 0:
            n //= 2
        else:
            n = n * 3 + 1
        count += 1

    return count
