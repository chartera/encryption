type
  Sizet = uint16
  
proc crypt_checkpass(pw: cstring, hash: cstring): cint {.importc, header: "unistd.h"}

proc crypt_newhash(pw: cstring, pref: cstring, hash: cstring, hashsize: Sizet): cint
    {.importc, header: "unistd.h"}

proc get_hash*(value: string): string =
  var hash: cstring = cstring(newString(127))
  discard crypt_newhash(value, "bcrypt", hash, 127)
  result = $hash

proc compare*(password: string, hash: string): bool =
  let check = crypt_checkpass(password, hash)
  if check == 0:
    result = true
  else:
    result = false

