def from lines, at: 0
  at += 1 until lines[at] != "\n"
  new lines, at: at
end
