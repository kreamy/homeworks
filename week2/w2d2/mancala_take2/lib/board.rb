class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {[]}
    place_stones
  end

  def place_stones
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times { cup << :stone }
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos = start_pos.between?(1, 14)
  end

  def make_move(start_pos, current_player_name)
    temp = @cups[start_pos]
    @cups[start_pos] = []

    current_pos = start_pos

    until temp.empty?
      current_pos += 1

      if current_pos == 6
        @cups[current_pos % 14] << temp.shift if current_player_name == @name1
      elsif current_pos == 13
        @cups[current_pos % 14] << temp.shift if current_player_name == @name2
      else
        @cups[current_pos % 14] << temp.shift
      end
    end

    render
    next_turn(current_pos)
    # p "start cup - #{@cups[start_pos]}"
    # p "cups - #{@cups}"
    # p "temp - #{temp}"
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx % 14].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all? { |cup| cup.empty? } ||
      @cups[7..12].all? { |cup| cup.empty? }

    false

    # return true if @cups[6].empty? || @cups[13].empty?
    # return false if !@cups[6].empty? && !@cups[13].empty?
  end

  def winner
    if @cups[6].count == 6 && @cups[13].count == 6
      :draw
    elsif @cups[6].count == 6
      @name1
    elsif @cups[13].count == 6
      @name2
    end
  end
end
