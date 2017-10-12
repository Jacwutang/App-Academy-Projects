class Array


  def my_uniq
    arr = []
    hash = Hash.new(0)

    self.each do |el|
      hash[el] += 1
    end

    hash.select {|k,value| value == 1}.keys
  end

  def two_sum
    result = []

    i = 0
    while i < self.length
      j = i + 1
      while j < self.length
        result << [i, j] if self[i] + self[j] == 0
        j +=1
      end
      i += 1
    end

    result
  end

  def my_transpose
    arr = Array.new(self.length) {Array.new(self.length)} #3x3


    self.each_with_index do |row,i|

      row.each_with_index do |col,j|
        arr[j][i] = self[i][j]
      end

    end

    arr
  end

  def stock_picker
    result_hash = Hash.new
    raise "Not numbers!" if self.any? {|el| el.is_a?(String)}
    i = 0
    while i < self.length
      j = i + 1
      while j < self.length
        result_hash[[i, j]] = self[j] - self[i]
        j +=1
      end
      i += 1
    end

    result_hash.sort_by {|k, val| val}.last[0]
  end



end
