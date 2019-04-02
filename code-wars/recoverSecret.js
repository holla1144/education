// https://www.codewars.com/kata/recover-a-secret-string-from-random-triplets/javascript

const recoverSecret = triplets => {
    let tripletsAsArr = combineTriplets(triplets);
    const sortedTriplets = sortTriplets(sortTriplets(tripletsAsArr, triplets), triplets)

    return removeDuplicateLetters(sortedTriplets).join("");
};

const sortTriplets = (arr, triplets) => {
    let sortedArr = arr;
    triplets.forEach( triplet => {
        const [first, second, third] = triplet;
        sortedArr = insertLetterBeforeIndex(second, sortedArr.indexOf(third), insertLetterBeforeIndex(first, sortedArr.indexOf(second), sortedArr));
    });

    return sortedArr;
};

const insertLetterBeforeIndex = (letter, index, arr) => {
    const arr_after_index = arr.slice(index, arr.length);
    const arr_before_index = arr.slice(0, index);

    return [].concat(arr_before_index, letter, arr_after_index)
};

const removeDuplicateLetters = arr => {
    const reducer = (acc, letter) => {
        if (acc.indexOf(letter) > -1) {
            return acc;
        }

        acc.push(letter);
        return acc;
    };

    return arr.reduce(reducer, []);
};

const combineTriplets = triplets => triplets.reduce((acc, triplet) => acc += triplet.join(''), "").split("");
