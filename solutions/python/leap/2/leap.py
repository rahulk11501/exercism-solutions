def leap_year(year):
    # A year must be divisible by 4 to be a leap year
    # If it is divisible by 100, it is NOT a leap year
    # Unless it is also divisible by 400
    return (
        year % 4 == 0 and
        (year % 100 != 0 or year % 400 == 0)
    )
