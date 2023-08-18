using SpacePrefix

class << self
  def from lines, at: 0
    at += 1 until lines[at] != "\n"
    new lines, at: at
  end
end

attr_reader :start_at, :end_at, :space_prefix

def stairs
  @stairs ||= []
end

def initialize lines, at: 0
  @start_at, @lines = at, lines

  next_index = at + 1
  @space_prefix, next_line = lines[at].space_prefix, lines[next_index]

  if next_line && (next_line.space_prefix - space_prefix) == 2
    until next_line.space_prefix <= space_prefix
      stair = Stair.from lines, at: next_index
      stairs << stair

      next_index = stair.end_at + 1
      next_line = lines[next_index]
      break unless next_line
    end

    @end_at = stairs.last.end_at
  else
    @end_at = at
  end
end

def line
  @line ||= @lines[@start_at].chomp.strip
end

def leaf?
  stairs.empty?
end
