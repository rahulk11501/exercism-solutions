"""Functions to help edit essay homework using string manipulation."""


def capitalize_title(title: str) -> str:
    """Return the title with each word capitalized."""
    return title.title()


def check_sentence_ending(sentence: str) -> bool:
    """Return True if the sentence ends with a period."""
    return sentence.endswith(".")


def clean_up_spacing(sentence: str) -> str:
    """Return the sentence without leading or trailing whitespace."""
    return sentence.strip()


def replace_word_choice(sentence: str, old_word: str, new_word: str) -> str:
    """Return the sentence with all occurrences of old_word replaced by new_word."""
    return sentence.replace(old_word, new_word)
