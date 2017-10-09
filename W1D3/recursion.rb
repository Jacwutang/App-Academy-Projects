def range_iterative(start, final)
  (start...final).to_a
end

# def range(start,final)
#   #arr = []
#   return arr if start >= final
#
#   return [start] if start == final - 1
#
#   arr = [start]
#   num = range(start+1,final)
#   arr.concat(num)
#   arr
#
# end
#(1,5) [1][2][3][4]
#(1,4) [1][2][3]
#(1,3) [1][2]
#(1,2) [1]
def range(start,final)
  return [] if start >= final
  return [final - 1] if start == final - 1

  arr = []
  result = range(start,final-1)
  arr.concat(result)
  arr.push ( final - start )
  arr
end

# def exp(b,n)
#   return 1 if n == 0
#   b * exp(b,n-1)
# end

def exp(b,n)
  return 1 if n == 0
  return b if n == 1

  if n.even?
    num = exp(b, n / 2)
    num * num
  else
    num = exp(b, (n - 1) / 2)
    b * num * num
  end
end


class Array
  def deep_dup

    arr = []
    self.each do |el|
      if el.is_a?(Array)
        arr << el.deep_dup
      else
        arr << el
      end
    end
    arr
  end
end

# arr = [1,2,[3,4]]
# arr2 = arr.deep_dup
# arr2[-1] = 5
# p arr
# p arr2

# def fib(n)
#   return nil if n < 1
#   return [1] if n == 1
#   return [1,1] if n == 2
#
#   f = [1, 1]
#
#   2.upto(n-1) do
#     f << f[-1] + f[-2]
#   end
#
#   f
# end

def fib(n)
  return [] if n < 1
  return [1] if n == 1
  return [1, 1] if n == 2

  prev_fib = fib(n - 1)
  num1 = prev_fib[-1]
  num2 = prev_fib[-2]
  prev_fib << num1 + num2
  prev_fib
end

# p fib(1)
# p fib(10)


def subsets(arr)
  return [[]] if arr.length == 0
  #return [arr] if arr.length == 1

  prev_set = subsets(arr[0..-2])
  new_subset = prev_set.map { |subarr| subarr + [arr[-1]] }

  prev_set + new_subset
end

# p subsets([])
# p subsets([1])
# p subsets([1, 2])
# p subsets([1, 2, 3])


def perm(arr)
  return [arr] if arr.length <= 1
  result = []
  arr.each_index do |idx|
    temp = perm(arr[0...idx] + arr[idx+1..-1])
    subset = temp.map { |sub| [arr[idx]] + sub }
    result += subset
  end

  result




  # return [arr] if arr.length <= 1
  # result = []
  #
  # arr.each_index do |idx|
  #
  #   other_perm = perm(arr[0...idx] + arr[idx+1..-1])
  #   row = other_perm.map { |subarr| [arr[idx]] + subarr }
  #   result += row
  # end
  #
  # result
end

p perm([1,2])
p perm([1,2,3])

def binary_search(arr,target)
  # if arr.length < 1
  #   return nil
  # end
  mid = arr.length / 2
  left = arr[0...mid]
  right = arr[mid..-1]

  if target == arr[mid]
    return mid
  elsif arr.length == 1
    return nil
  elsif target < arr[mid]
    binary_search(left,target)
  elsif target > arr[mid]
    value = binary_search(right,target)
    return nil if value.nil?
    value + left.length
  end

  # case target <=> arr[mid]
  # when 0
  #   return mid + shift
  # when -1
  #   binary_search(left, target)
  # when 1
  #   binary_search(right, target)
  #   shift += left.length
  # end
end

# p binary_search([1, 2, 3], 1) # => 0
# p binary_search([2, 3, 4, 5], 3) # => 1
# p binary_search([2, 4, 6, 8, 10], 6) # => 2
# p binary_search([1, 3, 4, 5, 9], 5) # => 3
# p binary_search([1, 2, 3, 4, 5, 6], 6) # => 5
# p binary_search([1, 2, 3, 4, 5, 6], 0) # => nil
# p binary_search([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
  if arr.length == 1
    return arr
  end
  mid = arr.length / 2
  left = arr[0...mid]
  right = arr[mid..-1]

  left_half = merge_sort(left)
  right_half = merge_sort(right)
  merge(left_half,right_half)
end

def merge(arr1,arr2)
  new_arr = []

  while arr1.length > 0 && arr2.length > 0
    if arr1[0] > arr2[0]
      new_arr.push(arr2[0])
      arr2.shift()
    elsif arr1[0] < arr2[0]
      new_arr.push(arr1[0])
      arr1.shift()
    end

    if arr1.empty? && !arr2.empty?
      new_arr.concat(arr2)
    elsif !arr1.empty? && arr2.empty?
      new_arr.concat(arr1)
    end
  end

  new_arr
end

# p merge_sort([5,4,3,2,1])
# p merge_sort([10,2,42,4])
# p merge_sort([1,5,2,4,3])

def greedy_change(num, coins)
  return [] if num <= 0

  result = []
  new_coin = coins.select { |coin| num - coin >= 0 }.max
  #p new_coin
  result << new_coin
  #p result
  #p greedy_change(num - new_coin, coins)
  result + greedy_change(num - new_coin, coins)
end

def better_change(num, coins)
  return [] if num < 0
  best_change = nil
  remainder = num

  coins.each do |coin|
    new_coins = coins.select { |c| c <= coin }
    remainder -= coin

    curr_change = [coin] + better_change(remainder, new_coins)
    p "coin: #{coin}; remainder: #{remainder}; new_coins: #{new_coins}"
    p "current change: #{curr_change}; best change: #{best_change}"
    if best_change.nil? || best_change.length > curr_change.length
      best_change = curr_change
    end
    # p best_change
  end

  best_change
end

#p better_change(24, [10, 7, 1])
