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

p (1..5).each { |n| "Current number is: #{n}" } == (1..5).my_each { |n| "Current number is: #{n}" } 