def add_prefix_un(word: str) -> str:
    return 'un' + word


def make_word_groups(words: str) -> str:
    return (' :: ' + words[0]).join(words)
    


def remove_suffix_ness(word: str) -> str:
    output = word.split('ness')[0]
    if output[-1] == 'i':
        return output[:-1] + 'y'
    return output


def adjective_to_verb(sentence: str, index: int) -> str:
    return sentence.split()[index].strip('.')+'en'
