class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
    @score = score
  end

  def is_ace?
    @value == 'A'
  end

  def is_king?
    @value == 'K'
  end

  def is_queen?
    @value == 'Q'
  end

  def is_jack?
    @value == 'J'
  end

  def is_face?
    is_king? || is_queen? || is_jack?
  end

  def is_value?
    !self.is_ace? && !self.is_face?
  end

  def to_s
    "#{@value}#{@suit}"
  end

  def score
    score = 0

    if is_value?
      score = @value.to_i
    elsif is_ace?
      score = 14
    elsif is_king?
      score = 13
    elsif is_queen?
      score = 12
    elsif is_jack?
      score = 11
    end

    score

  end

end
