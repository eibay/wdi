class Number < ActiveRecord::Base

    def self.isPrime
      prime = []
      Number.all.each do |y|

        divide_list = [*2..y-1]
        array_litmus = []
        divide_list.each do |x|

          array_litmus << y if y % x == 0
        end
        prime << y if array_litmus.length == 0

        
      end
      return prime
    end

end



      # prime = []
      # [*2..100].each do |y|
      #   divide_list = [*2..y-1]
      #   array_litmus = []
      #   divide_list.each do |x|

      #     array_litmus << y if y % x == 0
      #   end
      #   prime << y if array_litmus.length == 0

      #   puts prime
      # end