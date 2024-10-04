import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
  var result = [Int]()
  var works = [Int]()

  for i in 0 ..< progresses.count {
    var day = (Double(100 - progresses[i]) / Double(speeds[i]))
    works.append(Int(ceil(day)))
  }

  var stack = [Int]()
  for i in 0 ..< works.count {
    if stack.isEmpty {
      stack.append(works[i])
    } else {
      if stack.first! >= works[i] {
        stack.append(works[i])
      } else {
        result.append(stack.count)
        stack.removeAll()
        stack.append(works[i])
      }
    }
  }
  result.append(stack.count)

  return result
}
