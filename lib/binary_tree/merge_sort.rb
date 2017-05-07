module MergeSort
  def merge_sort(n)
    if n.size < 2
      n
    else
      left = merge_sort(n[0..n.size / 2 - 1]) # sort left half
      right = merge_sort(n[n.size / 2..-1])   # sort right half
      merge(left, right)                      # merge halves
    end
  end

  # Merge low<=>high until one side empty, append remaining side to result
  def merge(left, right, x = 0, y = 0, result = [])
    until left[x].nil? || right[y].nil?
      if (left[x] <=> right[y]) == -1
        result.push(*left[x])
        x += 1
      else
        result.push(*right[y])
        y += 1
      end
    end
    result += left[x].nil? ? right[y..-1] : left[x..-1]
    result
  end
end
