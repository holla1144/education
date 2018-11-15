class SimpleCipher {
    alphabet: string = "abcdefghijklmnopqrstuvwxyz"
    key: string
    isValidKey = (key:any) : boolean => key.toUpperCase() !== key && typeof(key) !== 'number'
    generateKey = (length: number = 100): string => {
        let randomKey: string = ""

        for (let i = 0; i < length; i++) {
            let randOf25: number = Math.floor(Math.random() * 25)
            randomKey += this.alphabet[randOf25]
        }
        return randomKey
    };

    constructor(userKey?: string) {
        if (userKey && !this.isValidKey(userKey)) {
            throw new Error("Bad key")
        }

        this.key = userKey || this.generateKey()
    }
    encode( word: string ) : string {
        let newWord: string = ""
        for (let i = 0; i < word.length; i++) {
            let correspondingKeyLetter: string = i > this.key.length - 1 ? this.key[i % this.key.length] : this.key[i]
            let letterIndex: number  = this.alphabet.indexOf(word[i])
            let cipherIndex: number = this.alphabet.indexOf(correspondingKeyLetter)
            let offset: number = letterIndex + cipherIndex > 26 - 1 ? (letterIndex + cipherIndex) - 26 : letterIndex + cipherIndex
            let cipherChar = this.alphabet[offset]
            newWord += cipherChar
        }
        return newWord;
    }

    decode( word: string) : string {
        let decipheredWord: string = ""
        for (let i = 0; i < word.length; i++) {
            let correspondingKeyLetter: string = i > this.key.length -1  ? this.key[i % this.key.length] : this.key[i]
            let letterIndex: number  = this.alphabet.indexOf(word[i])
            let cipherIndex: number = this.alphabet.indexOf(correspondingKeyLetter)
            let offset: number = letterIndex - cipherIndex < 0 ? letterIndex - cipherIndex + 26 : letterIndex - cipherIndex
            let decipheredCharacter: string = this.alphabet[offset]
            decipheredWord += decipheredCharacter
        };
        return decipheredWord
    }

}

export default SimpleCipher
