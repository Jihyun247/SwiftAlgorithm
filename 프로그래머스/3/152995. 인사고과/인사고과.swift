import Foundation

func solution(_ scores:[[Int]]) -> Int {
    let myScore = scores[0]

    let sortedScores = scores.sorted {
        $0[0] > $1[0] || ($0[0] == $1[0] && $0[1] < $1[1])
    }
    var secondMax = sortedScores[0][1]

    var passedScores: [Int] = []
    for score in sortedScores {
        if secondMax > score[1] {
            if score == myScore { return -1 }
        } else {
            passedScores.append(score[0] + score[1])
        }
        secondMax = max(secondMax, score[1])
    }

    passedScores = passedScores.sorted(by: >)
    let rank = passedScores.firstIndex(where: { $0 == myScore.reduce(0,+) })!
    return rank + 1
}