# 
# #O(n) space, O(n^2) time
# def my_min_a(list)
#   list_dup = list.dup
#   list.each do |n1|
#     list_dup.each do |n2|
#       if n1 < n2
#         list_dup.delete(n2)
#       end
#     end
#   end
#   list_dup[0]
# end
# 
# 
# # O(1) extra space, O(n) time
# def my_min_b(list)
#   min = list.first
#   list.each do |num|
#     min = num if num < min
#   end
#   min
# end
# 
# def largest_contiguous_sum_a(list) #O(n^3)
#   subsets = []
#   list.length.times do |i| #O(n^2)
#     (i...list.length).each do |j|
#       subsets << list[i..j] 
#     end
#   end
# 
#    subsets.map {|item| item.reduce(:+) }.max#O(n^3)
# end
# 
# # list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# # puts my_min_a(list)
# # puts my_min_b(list)
# 
# # # list = [5] * 20
# # print largest_contiguous_sum_a(list)
# # list = [2, 3, -6, 7, -6, 7]
# # print largest_contiguous_sum_a(list)
# # list = [-5, -1, -3]
# # print largest_contiguous_sum_a(list)
# 

def largest_contiguous_sum_b(list)#O(n)
cur_max = list.first #O(1)
max = list.first #O(1)
return list.max if list.all? {|el| el < 0}
list.length.times do |i|
  next if i == 0
  cur_max = [list[i] + cur_max, list[i]].max
  max = cur_max if cur_max > max
end
max
end 
test_1 = (-1_000_000..-1).to_a
list = [-5, -1, -3]
p largest_contiguous_sum_b(test_1) #=> -1
# t = [5, 3, -7]
# p largest_contiguous_sum_b(t)# => 8
# 
# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_sum_b(list) # => 8 (from [7, -6, 7])

