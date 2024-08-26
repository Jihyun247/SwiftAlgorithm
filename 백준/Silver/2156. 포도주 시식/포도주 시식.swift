import Foundation

var glasses: [Int] = [0]
let glassCnt: Int = Int(readLine()!)!
for _ in 1 ... glassCnt {
  glasses.append(Int(readLine()!)!)
}

// - 두번째 시도
var dp: [Int] = Array(repeating: 0, count: glassCnt + 1)
for i in 1 ... glassCnt {
  if i == 1 {
    dp[i] = glasses[i]
  } else if i == 2 {
    dp[i] = glasses[i-1] + glasses[i]
  } else {
    // 4개라고 가정할 때, (1+2+new), (1+3+new), 제일 최근 max (연달아 세개가 될 경우) 중 max
    dp[i] = max(dp[i-2] + glasses[i], dp[i-3] + glasses[i-1] + glasses[i], dp[i-1])
  }
}

print(dp[glassCnt])