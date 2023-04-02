# https://leetcode.com/problems/longest-substring-without-repeating-characters/

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    max_length = 0
    i = 0
    j = 1
    seen = Set.new([s[i]])
    while i < s.length
        if seen.include?(s[j]) || j == s.length
            max_length = [max_length, j - i].max
            duplicate_char = s[j]
            while s[i] != duplicate_char
                seen.delete(s[i])
                i += 1
            end
            seen.delete(s[i])
            i += 1
        else
            seen.add(s[j])
            j += 1
        end
    end
    return max_length
end

# Older 2021-11-04 O(n^2) solution that shouldn't have been accepted:
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
