import Foundation

let times = readLine()!.components(separatedBy: " ")

var inTimeStudents = Set<String>()
var endInTimeStudets = Set<String>()

while true {
  guard let info = readLine() else { break }
  if info.isEmpty { break }

  let infoArr = info.components(separatedBy: " ")
  let time: String = infoArr[0]
  let nickname: String = infoArr[1]

  if time <= times[0] {
    inTimeStudents.insert(nickname)
  } else if time >= times[1] && time <= times[2] {
    endInTimeStudets.insert(nickname)
  }
}
let result = inTimeStudents.intersection(endInTimeStudets)
print(result.count)