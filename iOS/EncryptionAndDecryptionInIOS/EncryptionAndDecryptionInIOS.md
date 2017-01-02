# How we can implement Encryption and Decryption in iOS?

```Encryption``` is a process of converting plain text data into a ciper text data, which is non readable format.

Encryption is of two types:

1. Symmetric Encryption (Secret key) -

It uses a secret key for encryption and decryption of the plaintext. We have to send / share this secret key to receiver. If the secret key is exposed, then anyone can be decrypt the data.

2. Asymmetric Encryption (Public key) -

Sender and Receiver has a pair of private and public key. Private key is used for decryption of data and public key is used for encryption of data.

In iOS, encrpytion and decryption can be implemented by:

1. ```CommonCrypto``` class of ```security.framework```
2. ```CryptoSwift```
3. ```RNCryptor```