refine String do
  def space_prefix
    prefix = 0
    prefix += 1 until self[prefix] != ' '
    prefix
  end
end
