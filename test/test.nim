import  bcrypt, os

var salt = "NYt3t==ttabc"

var pw1 = "abc"
var hash1 = hash(pw1, salt)
echo("pw1 hash is: ", hash1)

var pw2 = "abc"
var hash2 = hash(pw2, salt)

echo("pw2 hash is: ", hash2)

echo compare(hash1, hash2)
