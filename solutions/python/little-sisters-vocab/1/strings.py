def add_prefix_un(word):
    return f"un{word}"


def make_word_groups(words):
    size = len(words)
    prefix = words[0]
    output = words[0]
    for i in range(1,size):
        output += f" :: {prefix}{words[i]}"
    return output
    


def remove_suffix_ness(word):
    output = word.split("ness")[0]
    if output[-1] == 'i':
        return output[:-1] + 'y'
    return output


def adjective_to_verb(sentence, index):
    import re
    word = sentence.split(" ")[index] + 'en'
    return re.sub(r'[^A-Za-z0-9\s]', '', word)
