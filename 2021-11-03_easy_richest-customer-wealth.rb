# https://leetcode.com/problems/richest-customer-wealth/submissions/

# @param {Integer[][]} accounts
# @return {Integer}
def maximum_wealth(accounts)
    maxWealth = 0
    for amounts in accounts
        wealth = 0
        for amount in amounts
            wealth += amount
        end
        if wealth > maxWealth
            maxWealth = wealth
        end
    end
    return maxWealth
end
