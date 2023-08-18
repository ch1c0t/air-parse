using SpacePrefix
include Public
extend From

def initialize lines, at: 0
  @start_at, @lines = at, lines

  next_index = at + 1
  next_line = lines[next_index]

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
