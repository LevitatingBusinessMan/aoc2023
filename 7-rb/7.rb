order = [:five_of_a_kind, :four_of_a_kind, :full_house, :three_of_a_kind, :two_pair, :one_pair, :high_card]

def card_sort a, b
  card_order = ["A", "K", "Q", "J", "T", "9", "8", "7", "6", "5", "4", "3", "2"]
  if card_order.index(a.chars.first) == card_order.index(b.chars.first)
    card_sort a[1..], b[1..]
  else
    card_order.index(a.chars.first) <=> card_order.index(b.chars.first)
  end
end

def identify_hand hand
	case hand.chars.uniq.length
	when 1
		return :five_of_a_kind
	when 2
		case hand.count hand.chars.first
		when 4,1
			return :four_of_a_kind
		else
			return :full_house
		end
	when 3
		return :three_of_a_kind if hand.chars.any? {|c| hand.chars.count(c) === 3}
		return :two_pair
	when 4
		return :one_pair
	else
		return :high_card
	end
end

p File.read("input").lines.map(&:split).map{|h,b|[h,b.to_i]}.sort! { |(hand1, bid1), (hand2, bid2)|
	if order.index(identify_hand hand1) == order.index(identify_hand hand2)
		card_sort hand1, hand2
	else
		order.index(identify_hand hand1) <=> order.index(identify_hand hand2)
	end
}.reverse.each.with_index(1).reduce(0) { |acc, ((hand, bid), i)| acc + bid * i }
