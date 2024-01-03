import Foundation

let homeCnt = Int(readLine()!)!
let homeLocations = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted(by: <)

var answer: Int = 0
if homeCnt % 2 == 0 { // 짝수
    answer = homeLocations[homeCnt/2 - 1]
} else { // 홀수
    answer = homeLocations[homeCnt/2]
}
print(answer)