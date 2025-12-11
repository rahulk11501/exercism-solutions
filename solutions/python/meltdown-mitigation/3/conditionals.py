"""Utilities for assessing nuclear reactor stability and safety conditions."""


def is_criticality_balanced(temperature: float, neutrons_emitted: float) -> bool:
    """Return True if reactor criticality is within safe operating limits.

    Parameters:
        temperature (float): Temperature in kelvin.
        neutrons_emitted (float): Neutrons emitted per second.

    Returns:
        bool: Whether criticality is balanced.
    """
    return (
        temperature < 800
        and neutrons_emitted > 500
        and temperature * neutrons_emitted < 500_000
    )


def reactor_efficiency(voltage: float, current: float, theoretical_max_power: float) -> str:
    """Classify the reactor's efficiency zone based on generated power.

    Parameters:
        voltage (float)
        current (float)
        theoretical_max_power (float)

    Returns:
        str: Efficiency band — "green", "orange", "red", or "black".
    """
    generated_power = voltage * current
    efficiency = (generated_power / theoretical_max_power) * 100

    if efficiency >= 80:
        return "green"
    if efficiency >= 60:
        return "orange"
    if efficiency >= 30:
        return "red"
    return "black"


def fail_safe(temperature: float, neutrons_per_second: float, threshold: float) -> str:
    """Return the safety status code of the reactor.

    Parameters:
        temperature (float)
        neutrons_per_second (float)
        threshold (float): The threshold product that defines safe operation.

    Returns:
        str: Status code — "LOW", "NORMAL", or "DANGER".
    """
    product = temperature * neutrons_per_second
    lower_bound = 0.9 * threshold
    upper_bound = 1.1 * threshold

    if product < lower_bound:
        return "LOW"
    if product <= upper_bound:
        return "NORMAL"
    return "DANGER"
