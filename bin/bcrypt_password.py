import base64
import bcrypt
import hashlib
import random
import string


def hash_shit(password):
    hashed = bcrypt.hashpw(
        base64.b64encode(hashlib.sha256(password).digest()),
        bcrypt.gensalt()
    )

    print('password: [{}]'.format(password))
    print('bcrypted: [{}]'.format(hashed))


def generate_random_password():
    return ''.join(
        random.SystemRandom().choice(string.ascii_letters + string.digits)
        for _ in range(64)
    ).encode('utf-8')


hash_shit(generate_random_password())
hash_shit(generate_random_password())
