"""Rules for the classic arcade game Pac-Man."""


def eat_ghost(power_pellet_active: bool, touching_ghost: bool) -> bool:
    """
    Return True if Pac-Man can eat a ghost.

    Args:
        power_pellet_active: Whether Pac-Man currently has an active power pellet.
        touching_ghost: Whether Pac-Man is touching a ghost.

    Returns:
        True if Pac-Man can eat the ghost, otherwise False.
    """
    return power_pellet_active and touching_ghost


def score(touching_power_pellet: bool, touching_dot: bool) -> bool:
    """
    Return True if Pac-Man has scored.

    Args:
        touching_power_pellet: Whether Pac-Man is touching a power pellet.
        touching_dot: Whether Pac-Man is touching a dot.

    Returns:
        True if a dot or power pellet has been eaten.
    """
    return touching_power_pellet or touching_dot


def lose(power_pellet_active: bool, touching_ghost: bool) -> bool:
    """
    Return True if Pac-Man loses the game.

    Args:
        power_pellet_active: Whether Pac-Man has an active power pellet.
        touching_ghost: Whether Pac-Man is touching a ghost.

    Returns:
        True if Pac-Man touches a ghost without a power pellet.
    """
    return touching_ghost and not power_pellet_active


def win(has_eaten_all_dots: bool, power_pellet_active: bool, touching_ghost: bool) -> bool:
    """
    Return True if Pac-Man wins the game.

    Args:
        has_eaten_all_dots: Whether all dots have been eaten.
        power_pellet_active: Whether Pac-Man has an active power pellet.
        touching_ghost: Whether Pac-Man is touching a ghost.

    Returns:
        True if all dots are eaten and Pac-Man has not lost.
    """
    return has_eaten_all_dots and not lose(power_pellet_active, touching_ghost)
