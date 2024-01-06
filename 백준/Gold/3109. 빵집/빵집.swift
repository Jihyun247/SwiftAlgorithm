import Foundation

let firstInput = readLine()!.split(separator: " ").map { Int($0)! }
let R = firstInput[0]
let C = firstInput[1]
var map: [[Bool]] = []
var answer: Int = 0
let nextStep: [Int] = [-1, 0, +1]

for _ in 0..<R {
    map.append(readLine()!.map { $0 == "." })
}

func dfs(_ row: Int, _ col: Int) -> Bool {
    if col == C-1 { return true }

    for i in 0..<3 {
        //print(row + nextStep[i], col+1)
        let nextRow = row + nextStep[i]
        let nextCol = col + 1

        if isInRange(nextRow, nextCol) && map[nextRow][nextCol] {
            map[nextRow][nextCol] = false
            if dfs(nextRow, nextCol) { return true }
        }
    }
    return false
}

func isInRange(_ row: Int, _ col: Int) -> Bool {
  return row >= 0 && row < R && col >= 0 && col < C
}

for i in 0..<R { answer += dfs(i, 0) ? 1 : 0 }
print(answer)