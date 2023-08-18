using SpacePrefix

attr_reader :start_at, :end_at

def space_prefix
  @space_prefix ||= @lines[@start_at].space_prefix
end

def stairs
  @stairs ||= []
end

def line
  @line ||= @lines[@start_at].chomp.strip
end

def leaf?
  stairs.empty?
end
