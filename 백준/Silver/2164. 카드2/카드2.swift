import Foundation

let N = Int(readLine()!)!
var cards = Array<Int>(1...N)
var point = 0
func action(cards: inout [Int], point: inout Int) {
    cards[point] = 0
    cards.append(cards[point + 1])
    cards[point + 1] = 0
    if cards[cards.count - 2] == 0 { print(cards.last!) }
    point += 2
}

if cards.count == 1 {
    print(1)
} else {
    while cards[cards.count - 2] != 0 {
        action(cards: &cards, point: &point)
    }
}