import Foundation

let cnt = Int(readLine()!)!
var before = readLine()!.split(separator: " ").map { Int($0)! }
var after = readLine()!.split(separator: " ").map { Int($0)! }
var diff = [Int]()
for (bef, aft) in zip(before, after) {
    diff.append(aft - bef)
}

//var diff = [-2, 1, -2, 0]

var dp = [Int].init(repeating: 0, count: cnt)
dp[0] = abs(diff[0])

for i in 1..<cnt {
    if diff[i] * diff[i-1] > 0 {
        dp[i] = dp[i-1] + max(0, abs(diff[i]) - abs(diff[i-1]))
    } else {
        dp[i] = dp[i-1] + abs(diff[i])
    }
}

print(dp[cnt-1])