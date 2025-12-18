def is_armstrong_number(n: int) -> bool:
    digits = [int(d) for d in str(n)]
    power = len(digits)

    return sum(d ** power for d in digits) == n
