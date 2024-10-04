import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var answer = 1
    var dict = [String: Int]()
    for cloth in clothes {
        dict[cloth[1], default: 0] += 1
    }
    
    for i in dict {
        answer *= (i.value + 1)
    }
    
    return answer - 1
}