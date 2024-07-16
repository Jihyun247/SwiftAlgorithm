import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
var N = input[0]
let K = input[1]

let binaryN = Array(String(N, radix: 2))
var array: Array<Int> = []
for (idx, bin) in binaryN.enumerated() {
    if bin == "1" {
        array.append(binaryN.count - 1 - idx)
    }
}

if array.count <= K {
    print(0)
} else {
    let sum = array[K..<array.count].reduce(0) {
        return Double($0) + pow(2.0, Double($1))
    }
    let neededBottleNum = pow(2, Double(array[K-1])) - sum
    print(Int(neededBottleNum))
}