
Colors = %i[magenta red orange yellow green blue purple]

def encode(digits, prev=:purple)
  digits.collect { |d| prev = (Colors - [prev])[d] }
end

def decode(colors, prev=:purple)
  colors.collect { |c| (Colors - [prev]).index(prev=c) }
end

