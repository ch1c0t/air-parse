module ::Air
  def self.parse_file path
    parse IO.read path
  end

  def self.parse source
    Parse[source]
  end
end

def self.[] source
  stairs = []

  lines, cursor = source.lines, 0
  endpoint = lines.size

  until cursor == endpoint
    stair = Stair.from lines, at: cursor
    stairs << stair

    cursor = stair.end_at + 1
  end

  stairs
end
