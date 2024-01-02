import Foundation

let firstLine = readLine()!.components(separatedBy: " ")
var leakCnt = Int(firstLine[0])!
var tapeLength = Float(firstLine[1])!
let leakPlaces = readLine()!.components(separatedBy: " ").map { Float($0)! }.sorted(by: <)

var tapeCnt: Int = 0
var tapeEnd: Float = 0
for place in leakPlaces {
    if tapeEnd == 0 || tapeEnd < place + 0.5 { // 테이프 길이가 0인 경우||테이프 길이가 place 커버 못하는 경우
        tapeCnt += 1
        tapeEnd = place - 0.5 + tapeLength
    }
}

print(tapeCnt)