import Foundation

func solution(_ maps:[String]) -> [Int] {
  let maps2 = maps.map { Array($0) }
  let R = maps.count
  let C = maps[0].count

  var visited = Array(
    repeating: Array(repeating: false, count: C),
    count: R
  )

  var answer: [Int] = []
  var day: Int = 0
  func dfs(x: Int, y: Int) {
    if x < 0 || y < 0 || x >= R || y >= C || visited[x][y] || maps2[x][y] == "X"
    { return }
    visited[x][y] = true
    day += Int(String(maps2[x][y]))!

    dfs(x: x, y: y+1)
    dfs(x: x, y: y-1)
    dfs(x: x+1, y: y)
    dfs(x: x-1, y: y)
  }

  for r in 0 ..< R {
    for c in 0 ..< C {
      dfs(x: r, y: c)
      if day != 0 {
        answer.append(day)
        day = 0
      }
    }
  }
  
  if answer.isEmpty {
    return [-1]
  } else {
    return answer.sorted(by: <)
  }
}