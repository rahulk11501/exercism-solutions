"""Functions to prevent a nuclear meltdown."""


def is_criticality_balanced(temperature: int | float, neutrons_emitted: int | float) -> bool:
    """Verify criticality is balanced.

    :param temperature: int or float - temperature value in kelvin.
    :param neutrons_emitted: int or float - number of neutrons emitted per second.
    :return: bool - is criticality balanced?
    """
    return (
        temperature < 800
        and neutrons_emitted > 500
        and (temperature * neutrons_emitted) < 500000
    )


def reactor_efficiency(voltage: int | float, current: int | float, theoretical_max_power: int | float) -> str:
    """Assess reactor efficiency zone."""
    generated_power = voltage * current
    efficiency = (generated_power / theoretical_max_power) * 100

    if efficiency >= 80:
        return "green"
    elif efficiency >= 60:
        return "orange"
    elif efficiency >= 30:
        return "red"
    else:
        return "black"


def fail_safe(temperature: int | float, neutrons_produced_per_second: int | float, threshold: int | float) -> str:
    """Assess and return status code for the reactor."""
    product = temperature * neutrons_produced_per_second

    lower_bound = 0.9 * threshold
    upper_bound = 1.1 * threshold

    if product < lower_bound:
        return "LOW"
    elif lower_bound <= product <= upper_bound:
        return "NORMAL"
    else:
        return "DANGER"
