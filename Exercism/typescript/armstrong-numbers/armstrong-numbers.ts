class ArmstrongNumbers {
    public static isArmstrongNumber( candidate: number) : boolean {
        const candidateAsArr: string[] = candidate.toString().split("");
        const exponent: number = candidateAsArr.length
        let accumulator: number = 0

        candidateAsArr.forEach(stringNum => {
            const num:number = Number(stringNum)
            accumulator += num ** exponent
        })
        return accumulator === candidate
    }
}

export default ArmstrongNumbers