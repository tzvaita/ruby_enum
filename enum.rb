module Enumerable

    def my_each
        return to_enum unless block_given?

        x = 0

        while x < self.size
            yield(to_a[x])

            x += 1
        end

        self

    end
end

def my_each_with_index
    return to_enum unless block_given?

    x = 0
    while x < self.length
      yield(self[x], x)
      x += 1
    end
    self
  end

  def my_select
    return to_enum(:my_each) if !block_given?

    arr = []
    x = 0
    while x < self.length
      if yield(self[x])
        arr << self[x]
      end
      x += 1
    end
    arr
  end