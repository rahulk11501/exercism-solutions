"""Rules for the classic arcade game Pac-Man."""


def eat_ghost(power_pellet_active: bool, touching_ghost: bool) -> bool:
    """Return True if Pac-Man can eat a ghost."""
    return power_pellet_active and touching_ghost


def score(touching_power_pellet: bool, touching_dot: bool) -> bool:
    """Return True if Pac-Man has scored."""
    return touching_power_pellet or touching_dot


def lose(power_pellet_active: bool, touching_ghost: bool) -> bool:
    """Return True if Pac-Man loses the game."""
    return touching_ghost and not power_pellet_active


def win(has_eaten_all_dots: bool, power_pellet_active: bool, touching_ghost: bool) -> bool:
    """Return True if Pac-Man wins the game."""
    return has_eaten_all_dots and not lose(power_pellet_active, touching_ghost)
