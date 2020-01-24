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

    def my_all?(pat = nil)
        result = true
        if block_given?
        my_each { |ele| result &= (yield ele) }
        elsif pat
        my_each { |ele| result &= pat === ele }
        else
        my_each { |ele| result &= ele }
        end
        result
    end

    def my_any?(pat = nil)
        result = false
        if block_given?
        my_each { |ele| result = true if yield ele }
        elsif pat
        my_each { |ele| result = true if pattern?(ele, pat) }
        else
        my_each { |ele| result = true if ele }
        end
        result
    end

    def my_none?(pat = nil)
        result = true
        if block_given?
        my_each { |ele| result = false if yield ele }
        elsif pat
        my_each { |ele| result = false if pattern?(ele, pat) }
        else
        my_each { |ele| result = false if ele }
        end
        result
    end

end