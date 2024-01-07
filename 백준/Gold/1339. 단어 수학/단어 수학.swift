import Foundation

var numCnt = Int(readLine()!)!
var array = [[String]]()
for _ in 0..<numCnt {
    let string = readLine()!.map { String($0) }
    array.append(string)
}

var maxDict = [String: Int]()
for i in 0..<numCnt {
    for j in 0..<array[i].count {
        maxDict[array[i][j], default: 0] += Int(pow(10.0, Double(array[i].count - j - 1)))
    }
}

var sum = 0
var number = [Int].init(0...9)
for i in maxDict.sorted(by: { $0.value > $1.value }) {
    sum += i.value * number.removeLast()
}

print(sum)