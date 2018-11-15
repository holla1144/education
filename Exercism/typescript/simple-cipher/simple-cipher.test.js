"use strict";
exports.__esModule = true;
var simple_cipher_1 = require("./simple-cipher");
describe('Random key generation', function () {
    it('generates keys at random', function () {
        // Strictly speaking, this is difficult to test with 100% certainty.
        // But, if you have a generator that generates 100-character-long
        // strings of lowercase letters at random, the odds of two consecutively
        // generated keys being identical are astronomically low.
        expect(new simple_cipher_1["default"]().key).not.toEqual(new simple_cipher_1["default"]().key);
    });
});
describe('Random key cipher', function () {
    var simpleCipher = new simple_cipher_1["default"]();
    it('has a key made of letters', function () {
        expect(simpleCipher.key).toMatch(/^[a-z]+$/);
    });
    it('has a key that is at least 100 characters long', function () {
        expect(simpleCipher.key.length).toBeGreaterThanOrEqual(100);
    });
    // Here we take advantage of the fact that plaintext of "aaa..."
    // outputs the key. This is a critical problem with shift ciphers, some
    // characters will always output the key verbatim.
    it('can encode', function () {
        expect(simpleCipher.encode('aaaaaaaaaa')).toEqual(simpleCipher.key.substr(0, 10));
    });
    it('can decode', function () {
        expect(simpleCipher.decode(simpleCipher.key.substr(0, 10))).toEqual('aaaaaaaaaa');
    });
    it('is reversible', function () {
        var plaintext = 'abcdefghij';
        expect(simpleCipher.decode(simpleCipher.encode(plaintext))).toEqual(plaintext);
    });
});
describe('Incorrect key cipher', function () {
    it('throws an error with an all caps key', function () {
        expect(function () {
            new simple_cipher_1["default"]('ABCDEF');
        }).toThrowError('Bad key');
    });
    it('throws an error with a numeric key', function () {
        expect(function () {
            new simple_cipher_1["default"]('12345');
        }).toThrow('Bad key');
    });
    // it('throws an error with an empty key', function () {
    //     expect(function () {
    //         new simple_cipher_1["default"]('');
    //     }).toThrow('Bad key');
    // });
});
describe('Substitution cipher', function () {
    var key = 'abcdefghij';
    var simpleCipher = new simple_cipher_1["default"](key);
    it('keeps the submitted key', function () {
        expect(simpleCipher.key).toEqual(key);
    });
    it('can encode', function () {
        expect(simpleCipher.encode('aaaaaaaaaa')).toEqual('abcdefghij');
    });
    it('can decode', function () {
        expect(simpleCipher.decode('abcdefghij')).toEqual('aaaaaaaaaa');
    });
    it('is reversible', function () {
        expect(simpleCipher.decode(simpleCipher.encode('abcdefghij'))).toEqual('abcdefghij');
    });
    it(': double shift encode', function () {
        expect(new simple_cipher_1["default"]('iamapandabear').encode('iamapandabear'))
            .toEqual('qayaeaagaciai');
    });
    it('can wrap on encode', function () {
        expect(simpleCipher.encode('zzzzzzzzzz')).toEqual('zabcdefghi');
    });
    it('can wrap on decode', function () {
        expect(simpleCipher.decode('zabcdefghi')).toEqual('zzzzzzzzzz');
    });
    it('can handle messages longer than the key (encode)', function () {
        expect(new simple_cipher_1["default"]('abc').encode('iamapandabear'))
            .toEqual('iboaqcnecbfcr');
    });
    it('can handle messages longer than the key (decode)', function () {
        expect(new simple_cipher_1["default"]('abc').decode('iboaqcnecbfcr'))
            .toEqual('iamapandabear');
    });
});
