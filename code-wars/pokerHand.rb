# https://www.codewars.com/kata/ranking-poker-hands/train/ruby

class PokerHand
  attr_reader :normalized_hand

  @@value_map = { "T": 10, "J": 11, "Q": 12, "K": 13, "A": 14 }

  def initialize(hand)
    @normalized_hand = normalize_hand(hand)
  end

  def compare_with(other)
    other_score = other.hand_score
    if hand_score > other_score
      'Win'
    elsif hand_score < other_score
      'Loss'
    else
      resolve_tie(other.normalized_hand.reverse)
    end
  end

  def resolve_tie(other)
    result = nil
    normalized_hand.reverse.each_with_index do |card, index|
      if card[0] > other[index][0]
        result = 'Win'
        break
      elsif card[0] < other[index][0]
        result = 'Loss'
        break
      else
        next
      end
    end

    result || 'Tie'
  end

  def sum_weighted_card_values(hand)
    sum = 0
    hand.map { |card| card[0] * 0.01 }.each { |val| sum += val }
    sum
  end

  def hand_score
    straight_flush? || four_of_a_kind? || full_house? || flush? || straight? || three_of_a_kind? || two_pair? || pair? || weighted_highest
  end

  def hand_to_val_suit_tuples(hand)
    hand.split(' ').map { |card| [card[0, card.length - 1], card[card.length - 1]] }
  end

  def normalize_hand(hand)
    initial_hand = hand_to_val_suit_tuples(hand)
    initial_hand.map do |elem|
      candidate = elem.first.to_sym
      if @@value_map.key?(candidate)
        [@@value_map[candidate], elem[1]]
      else
        [elem[0].to_i, elem[1]]
      end
    end.sort_by { |elem| elem[0]  }
  end

  def weighted_highest
    @normalized_hand.last[0] * 0.01
  end

  def x_of_a_kind(count, score_value)
    repeat_count = hand_by_card_freq(@normalized_hand).last[1]
    most_repeated_card = hand_by_card_freq(@normalized_hand).last[0]
    match_count = repeat_count == count
    match_count ? score_value + (most_repeated_card * 0.01) : nil
  end

  def pair?
    # if hand contains a pair, 1 + value of pair card x 001 (1.02 - 1.14)
    x_of_a_kind(2, 1)
  end

  def two_pair?
    # if hand has two pairs, returns 2 + the combined total of the hands two pair values each multiplied by 0.05 (2.04 - 2.28)
    cards_by_freq = hand_by_card_freq(@normalized_hand)
    uniq_cards = cards_by_freq.uniq
    two_pair = uniq_cards.count == 3 && uniq_cards.last[1] == 2 && uniq_cards[1][1] == 2

    two_pair ? 2 + (0.01 * uniq_cards.last[0]) + (0.01 * uniq_cards[1][0]) : nil
  end

  def three_of_a_kind?
    # if a given card value appears 4 times, returns value of 3 + value of quadrupled card x 0.05 (3.02 - 3.14)
    x_of_a_kind(3, 3)
  end

  def four_of_a_kind?
    # if a given card value appears 4 times, returns value of 7 + value of quadrupled card x 0.05 (7.02 - 7.14)
    x_of_a_kind(4, 7)
  end

  def full_house?
    # if hand contains 3 of one card value and 2 of a second card value, returns 6 + the value of the triplicate card x 0.01
    cards_by_freq = hand_by_card_freq(@normalized_hand)
    uniq_cards = cards_by_freq.uniq

    full_house = uniq_cards.last[1] == 3 && uniq_cards.count == 2
    full_house ? 6 + (uniq_cards.last[0] * 0.01) : nil
  end

  def hand_by_card_freq(hand)
    hand.map { |card| [card[0], hand.count { |item| item[0] == card[0] }] }.sort_by { |item| item[1] }
  end

  def straight?
    # if cards represent a discrete sequence in asceneding order, returns 4 + value of highest card in straight (4.02 - 4.14)
    straight = @normalized_hand.map { |card| card[0] } == (@normalized_hand.first[0]..@normalized_hand.first[0] + 4).to_a
    straight ? 4 + weighted_highest : nil
  end

  def flush?
    # If all cards are of the same suit, returns 5 + value of highest card in flush (5.02 - 5.14)
    straight = all_suits.uniq.count == 1 ? 6 : nil
    straight ? 5 + weighted_highest : nil
  end

  def straight_flush?
    # if hand is straight and a flush, returns value of 8 plus highest card * 0.01
    flush? && straight? ? 8 + weighted_highest : nil
  end

  def all_suits
    # takes a formatted hand and returns all of the suits in that hand
    @normalized_hand.map { |elem| elem[1] }
  end
end
