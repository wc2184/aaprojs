
def no_dupes?(arr)
    hash = Hash.new(0)
    arr.each do |ele|
        hash[ele] += 1
    end
    ans = []
    hash.each do |k, v|
        if v == 1
            ans << k
        end
    end
    ans
end
# Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0..arr.length - 2).each do |i|
       return false if arr[i] == arr[i + 1]
    end
    return true
end
# Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    #initialize default hash as array
    hash = Hash.new {|h, k| h[k] = Array.new}
    str.each_char.with_index do |char, i|
        hash[char] << i
    end
    hash
end
# Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    highest = 1
    arr = []
    i = 0
    while i < str.length
        count = 1
        while str[i] == str[i + 1]
            count += 1
            i += 1
        end
        if count >= highest
            highest = count 
            arr = str[i] * count
        end
        i += 1
    end
    arr
end


    # Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def prime(num)
    return false if num < 2
    (2...num).each do |factor|
        return false if num % factor == 0
    end
    return true
end

def bi_prime?(num)
    (2...num).each do |factor|
        if prime(factor)
            if num % factor == 0 # this was the crux of the problem. avoid dealing with floats by checking if its even
                #divisible in the first place
            return true if prime(num  / factor)
            end
        end
    end
    return false
end


# Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(str, arr)
    alpha = ("a".."z").to_a

    i = 0
    while i < str.length
        # i mod arr.length
        str[i] = alpha[(alpha.index(str[i]) + arr[(i % arr.length)]) % 26]
        i += 1
    end
    str
end
# Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"


def vowel_rotate(str)
    vowels = []
    str.each_char.with_index do |char, i|
        vowels << [char, i] if 'aeiou'.include?(char)
    end
    str.each_char.with_index do |char, i|
        if 'aeiou'.include?(char)
            magic = vowels.index {|e| e[1] == i}
            str[i] = vowels[(magic - 1) % vowels.length][0]
        end
    end
    str
end

# Examples
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

class String
    def select(&prc)
        ans = ""
        return ans if prc == nil
        self.each_char do |ele|
            ans += ele if prc.call(ele)
        end
        ans
    end

    def map!(&prc)
        self.each_char.with_index do |char, i|
            self[i] = prc.call(char, i)
        end
    end

end
# Examples
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""




# Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"


def multiply(a, b)
    return a if b == 1

    if a < 0 && b < 0
        a = -a
        b = -b
        return a + multiply(a, b - 1)
    end
    if (a < 0 && b > 0) || (a > 0 && b < 0)
        
        return -(a.abs + multiply(a.abs, b.abs - 1))
    end
    a + multiply(a, b - 1)
end


# Examples
# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18


def lucas_sequence(num)
    return [] if num == 0
    return [2] if num == 1
    return [2, 1] if num == 2
    lucas_sequence(num - 1) + [lucas_sequence(num - 1)[-1] + lucas_sequence(num - 1)[-2]] 
end

# Examples
# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]
def primed(num)
    return false if num < 2
    (2...num).each do |factor|
        return false if num % factor == 0
    end
    return true
end
def prime_factorization(num)
    return [num] if primed(num)

    next_num = num
    (2..num).reverse_each do |factor|
        next_num = factor if num % factor == 0
    end
    prime_factorization(next_num) + prime_factorization(num / next_num ) 
end

# Examples
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]