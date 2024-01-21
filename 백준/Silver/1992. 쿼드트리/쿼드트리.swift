import Foundation
/*
8
11110000
11110000
00011100
00011100
11110000
11110000
11110011
11110011
 */
let lineCnt = Int(readLine()!)!
var square: [[String]] = []
for _ in 0..<lineCnt {
    square.append(readLine()!.map { String($0) })
}
func printSquare(_ minI: Int, _ maxI: Int, _ minJ: Int, _ maxJ: Int) -> String {
    let firstBit: String = square[minI][minJ]
    for i in minI..<maxI {
        for j in minJ..<maxJ {
            if firstBit != square[i][j] {
                let nextI = (minI+maxI) / 2
                let nextJ = (minJ+maxJ) / 2
                return ("(\(printSquare(minI, nextI, minJ, nextJ))\(printSquare(minI, nextI, nextJ, maxJ))\(printSquare(nextI, maxI, minJ, nextJ))\(printSquare(nextI, maxI, nextJ, maxJ)))")
            }
        }
    }
    return firstBit
}
print(printSquare(0, lineCnt, 0, lineCnt))