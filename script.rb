def stock_picker(arr)
  [1].reduce([]) do |most_lucrative_pair, val|
    arr.each_with_index do |price, i|
      # We want to calculate the profit when buying in day i and each possible j day to sell
      # For that we want to start the j loop one day after i
      ((i + 1)..arr.length - 1).each do |j|
        unless i == (arr.length - 1)
          most_lucrative_pair[0], most_lucrative_pair[1] = i, j if most_lucrative_pair.empty?

          interaction_profit = get_profit(arr[i], arr[j])
          current_best_profit = get_profit(arr[most_lucrative_pair[0]], arr[most_lucrative_pair[1]])

          if is_profit2_bigger?(current_best_profit, interaction_profit)
            most_lucrative_pair[0] = i
            most_lucrative_pair[1] = j
            most_lucrative_pair
          else
            most_lucrative_pair
          end
        end
      end
    end
    p most_lucrative_pair
  end
end

def get_profit(buy_price, sell_price)
  sell_price - buy_price
end

def is_profit2_bigger?(profit1, profit2)
  profit1 < profit2
end

stock_picker([17,3,6,9,15,8,6,1,10])