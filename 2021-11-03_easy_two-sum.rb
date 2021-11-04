# https://leetcode.com/problems/two-sum/submissions/

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    p nums.class
    nums = nums.map.with_index {|num,i| [i, num]}
    nums = nums.sort_by { |item| item[1] }
    left = 0
    right = nums.length - 1
    while left < right
        sum = nums[left][1] + nums[right][1]
        if sum > target
            puts 'right -= 1'
            right -= 1
        elsif sum < target
            puts 'left += 1'
            left += 1
        else
            return [nums[left][0], nums[right][0]]
        end
    end
end
