import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var answer: Int64 = 0

    var dict: [Int: Int64] = [:]
    for weight in weights {
        dict[weight, default: 0] += 1
    }
    for i in dict where i.value >= 2 {
        answer += i.value * (i.value - 1) / 2
    }

    let setWeights = Set(weights)
    for weight in setWeights {
        if (weight*2) % 3 == 0 && weights.contains(weight * 2/3) {
            answer += dict[weight]! * dict[weight * 2/3]!
        }
        if weight % 2 == 0 && weights.contains(weight * 1/2) {
            answer += dict[weight]! * dict[weight * 1/2]!
        }
        if (weight*3) % 4 == 0 && weights.contains(weight * 3/4) {
            answer += dict[weight]! * dict[weight * 3/4]!
        }
    }
    return answer
}