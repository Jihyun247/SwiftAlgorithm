import Foundation

var separateByMinus = readLine()!.split(separator: "-").map {String($0)}
var answer = separateByMinus[0].split(separator: "+").map {Int(String($0))!}.reduce(0,+)

var temp = 0
for i in 1 ..< separateByMinus.count {
    let sum = separateByMinus[i].split(separator: "+").map {Int(String($0))!}.reduce(0,+)
    temp += sum
}
answer -= temp
print(answer)