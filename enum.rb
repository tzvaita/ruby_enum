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