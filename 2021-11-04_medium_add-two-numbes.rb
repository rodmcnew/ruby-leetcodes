# https://leetcode.com/problems/add-two-numbers/

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
    carry = 0
    head = nil
    prevNode = nil
    while l1 || l2 || carry != 0
        val = (l1 ? l1.val : 0) + (l2 ? l2.val : 0) + carry
        carry = val / 10
        newNode = ListNode.new(val % 10)
        if prevNode
            prevNode.next = newNode
        end
        prevNode = newNode
        head ||= newNode
        l1 = l1&.next || nil
        l2 = l2&.next || nil
    end
    return head
end
