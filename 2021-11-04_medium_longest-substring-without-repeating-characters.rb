# https://leetcode.com/problems/longest-substring-without-repeating-characters/

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    i = 0
    takenChars = Set.new
    maxSeenSize = 0;
    while i < s.length
        if takenChars.include?(s[i])
            i = i - takenChars.size + 1
            takenChars.clear
        end
        takenChars << s[i]
        maxSeenSize = takenChars.size if takenChars.size > maxSeenSize
        i += 1
    end
    return maxSeenSize
end
