
require "byebug"

def range(range_start, range_end)
    return [] if range_start >= range_end

    range(range_start, range_end-1) << range_end-1
end

def exp1(base, exponent)
    return 1 if exponent == 0
    return base if exponent == 1

    base * exp1(base,exponent - 1)
end

def exp2(base, exponent)
    return 1 if exponent == 0
    return base if exponent == 1

    if exponent.even? 
        return exp2(base, exponent/2)**2
    else
        return base * exp2(base, (exponent-1)/2)**2
    end
end

def deep_dup(arr)
    newarr = []
    (0...arr.length).each do |i|
        if arr[i].is_a?(Array)
            newarr <<deep_dup(arr[i])
        else
            newarr << arr[i]
        end
    end
    newarr
end

def fib(n)
    return [] if n == 0
    return [0] if n == 1
    return [0,1] if n == 2

    previous_fib = fib(n-1)
    previous_fib << previous_fib[-1] + previous_fib[-2]
end

def fib1(n)
    memo = []

    #fib(1)
    if n == 0
        memo << 0
        return memo
    elsif n == 1
        memo << 1
        return memo
    elsif n == 2
        memo << 1
        return memo
    end
    memo << 0 << 1 << 1
    p memo
    (4..n).each do |i|
        memo << memo[-1] + memo[-2]
    end
    memo
end

def bsearch(array, target)
    
    return nil if array.length == 0

    mid = array.length/2

    if array[mid] == target
        return mid
    elsif array[mid] >target
        bsearch(array[0...mid], target)
    else
        if bsearch(array[mid+1..-1], target) == nil
            return nil
        else
            mid + bsearch(array[mid+1..-1], target)+1
        end
    end

end

def merge_sort(arr)
    return arr if arr.length <= 1
    left = merge_sort(arr[0...arr.length/2])
    right  = merge_sort(arr[arr.length/2..-1])
    merge(left,right)
end

def merge(left,right)
    newArr = []
    #p [left, right]
    if !left
        return right
    end
    if !right 
        return left
    end
    while left.length > 0 && right.length > 0
        if left[0] < right[0]
            newArr << left.shift
        else
            newArr << right.shift
        end
    end

    newArr += left if left.length > 0
        
    newArr += right if right.length > 0
    newArr
end

# if arr = [1]
# subsets([]) << 1
# subsets(1) << 2
def subsets(arr)
    return [[]] if arr.empty?
    subs = subsets(arr[0...-1])

    subs.concat (subs.map {|row| row + [arr[-1]] })
   
    
end


#     return [] if arr.length == 0
#     return arr if arr.length == 1
#     (0...arr.length).each do |i|
#         arr << arr << subsets(arr[0...i]) << subsets(arr[i+1..-1])
#     end
#     arr
# end







