def first_anagram(str_one, str_two)
  split_string = str_two.split("")
  string_perm(str_one).include?(split_string)
end

def string_perm(str)
  str.split("").permutation.to_a
end

def second_anagram(str_one, str_two)
  str_one_split = str_one.split('')   #time -> O(n)
  str_two.chars.each do |el|
     str_one_split.delete_at(str_one_split.find_index(el)) unless str_one_split.find_index(el).nil? # O(n) * O(3n) => O(n^2) 
  end
  str_one_split.length == 0
end

def third_anagram(str_one,str_two)
 str_one.chars.sort == str_two.chars.sort
end

def fourth_anagram(str_one,str_two)
  hash = Hash.new(0)
  str_one.each_char do |char|
    hash[char] += 1
  end
  str_two.each_char do |char|
    if hash[char] > 0
      hash[char] -= 1
    else
      return false
    end
  end
 hash.all? {|k,v| v == 0}
end

