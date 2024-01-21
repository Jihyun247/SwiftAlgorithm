//3: 1, 6: 2, 12: 3
//import Foundation
//전 코드
//let power: Int = Int(readLine()!)! / 3
//var temp: [String] = []
//var starArray: [String] = ["  *  ", " * * ", "*****"]
//var space: String = "   "
//func recursion(_ num: Int) {
//    print(num)
//    if Int(pow(2.0, Double(num))) == power {
//        for i in 0..<num*3 {
//            print(space + starArray[i] + space)
//        }
//        for i in 0..<num*3 {
//            print(starArray[i] + " " + starArray[i])
//        }
//        return
//    }
//    temp = starArray
//    starArray = []
//    for i in 0..<num*3 {
//        print("첫 For", space + temp[i] + space)
//        starArray.append(space + temp[i] + space)
//    }
//    for i in 0..<num*3 {
//        print("두번째 For", temp[i] + " " + temp[i])
//        starArray.append(temp[i] + " " + temp[i])
//    }
//    space += space
//    recursion(num+1) // 3,6,9,..... / 3,6,12 순으로 가야한다
//}
//
//if power == 1 {
//    for star in starArray { print(star) }
//} else {
//    recursion(1)
//}

import Foundation

let input: Int = Int(readLine()!)!
var temp: [String] = []
var starArray: [String] = ["  *  ", " * * ", "*****"]
var space: String = "   "
func recursion(_ num: Int) {
    if num*2 == input {
        for i in 0..<num { // 삼각형 윗부분
            print(space + starArray[i] + space)
        }
        for i in 0..<num { // 삼각형 아랫부분
            print(starArray[i] + " " + starArray[i])
        }
        return
    }
    temp = starArray
    starArray = []
    for i in 0..<num { // 삼각형 윗부분
        starArray.append(space + temp[i] + space)
    }
    for i in 0..<num { // 삼각형 아랫부분
        starArray.append(temp[i] + " " + temp[i])
    }
    space += space
    recursion(num*2)
}

if input == 3 { // 같은 도형 세개 반복이 아님
    for star in starArray { print(star) }
} else {
    recursion(3)
}