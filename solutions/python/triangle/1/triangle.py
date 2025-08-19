def valid_triangle(sides: list[int]) -> bool:
    a, b, c = sorted(sides)  # sorting makes the inequality check simpler
    return a > 0 and a + b > c   # strict inequality, avoids degenerate triangles


def equilateral(sides: list[int]) -> bool:
    return valid_triangle(sides) and len(set(sides)) == 1


def isosceles(sides: list[int]) -> bool:
    return valid_triangle(sides) and len(set(sides)) <= 2


def scalene(sides: list[int]) -> bool:
    return valid_triangle(sides) and len(set(sides)) == 3
