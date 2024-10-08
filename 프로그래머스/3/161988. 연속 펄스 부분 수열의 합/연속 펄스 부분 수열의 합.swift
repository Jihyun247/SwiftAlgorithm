import Foundation

func solution(_ sequence:[Int]) -> Int64 {
    // 절대값이 가장 큰 것, 다 돌아봐야하나 ?
    // [1000, 1, -600, 400] 절대값이 가장 큰걸 찾아도 소용 없는 테케
    // [1000, 3, -5, 3] // 음양 번갈아 나타나는걸 찾아도 소용 없는 테케
    
    var negativePulse = [Int64]()
    var positivePulse = [Int64]()
    for (idx, num) in sequence.enumerated() {
        if idx % 2 == 0 {
            negativePulse.append(Int64(num * -1))
            positivePulse.append(Int64(num))
        } else {
            negativePulse.append(Int64(num))
            positivePulse.append(Int64(num * -1))
        }
    }
    
    let nPulseMax: Int64 = maxSubArray(negativePulse)
    let pPulseMax: Int64 = maxSubArray(positivePulse)
    return max(nPulseMax, pPulseMax)
}

func maxSubArray(_ nums: [Int64]) -> Int64 {
    guard !nums.isEmpty else { return 0 }
    
    var currentSum = nums[0]
    var maxSum = nums[0]
    
    for i in 1..<nums.count {
        currentSum = max(nums[i], currentSum + nums[i])
        maxSum = max(maxSum, currentSum)
    }
    
    return maxSum
}