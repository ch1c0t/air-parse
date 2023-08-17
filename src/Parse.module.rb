module ::Air
  def self.parse_file path
    parse IO.read path
  end

  def self.parse source
    Parse[source]
  end
end

def self.[] source
  []
end
