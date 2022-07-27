# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self == []
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum * 1.0 / self.length
  end

  def median
    return nil if self.empty?
    array = self.sort 
    if array.length % 2 == 0
        (array[array.length / 2 - 1] * 1.0 + array[array.length / 2]) / 2
    else
        array[array.length / 2]
    end
  end

  def counts
    hash = Hash.new(0)

    self.each do |ele|
        hash[ele] += 1
    end
    hash
  end

  ## part 2

  def my_count(val)
    count = 0
    self.each do |ele|
        count += 1 if ele == val
    end
    count
  end

  def my_index(val)
    self.each_with_index do |ele, i|
        return i if ele == val
    end
    return nil
  end

  def my_uniq
    array = []
    self.each do |ele|
        if !array.include?(ele)
            array << ele
        end
    end
    array
  end

  def my_transpose
    #[0][1] >> [1][0]
    ans = Array.new(self.length) {Array.new(self[0].length)}

    self.each_with_index do |subArr, i1|
        subArr.each_with_index do |ele, i2|
            ans[i2][i1] = ele
        end
    end
    ans

  end

end
