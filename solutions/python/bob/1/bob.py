def response(hey_bob):
    hey_bob = hey_bob.strip()
    if not hey_bob:
        return "Fine. Be that way!" 
    if hey_bob[-1] == '?':
       if check_yelling(hey_bob):
           return "Calm down, I know what I'm doing!"
       else:
            return "Sure."
    if check_yelling(hey_bob):
        return "Whoa, chill out!"    
    return "Whatever."

def check_yelling(input):
    letters = ''.join(ch for ch in input if ch.isalpha())
    return bool(letters) and letters.isupper()