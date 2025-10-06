def response(hey_bob: str) -> str:
    """Return Bob's response based on the tone of the input."""
    hey_bob = hey_bob.strip()

    if not hey_bob:
        return "Fine. Be that way!"

    is_question = hey_bob.endswith("?")
    is_yelling = hey_bob.isupper()

    if is_yelling and is_question:
        return "Calm down, I know what I'm doing!"
    if is_yelling:
        return "Whoa, chill out!"
    if is_question:
        return "Sure."

    return "Whatever."
