"""Solution to Ellen's Alien Game exercise."""


class Alien:
    """Create an Alien object with location x_coordinate and y_coordinate.

    Attributes
    ----------
    total_aliens_created: int
    x_coordinate: int - Position on the x-axis.
    y_coordinate: int - Position on the y-axis.
    health: int - Number of health points.
    """

    total_aliens_created: int = 0

    def __init__(self, x_coordinate: int, y_coordinate: int) -> None:
        self.x_coordinate = x_coordinate
        self.y_coordinate = y_coordinate
        self.health = 3
        Alien.total_aliens_created += 1

    def hit(self) -> None:
        """Decrement Alien health by one point."""
        self.health -= 1

    def is_alive(self) -> bool:
        """Return a boolean for if Alien is alive (if health is > 0)."""
        return self.health > 0

    def teleport(self, new_x_coordinate: int, new_y_coordinate: int) -> None:
        """Move Alien object to new coordinates."""
        self.x_coordinate = new_x_coordinate
        self.y_coordinate = new_y_coordinate

    def collision_detection(self, other):
        """Implementation TBD."""
        pass


def new_aliens_collection(alien_start_positions: list[int]) -> list[Alien]:
    """Function to return list of Aliens(class)"""
    aliens = []
    for coordinates in alien_start_positions:
        aliens.append(Alien(coordinates[0], coordinates[1]))
    return aliens
