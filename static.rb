#! /usr/bin/ruby

XSZ = 50
YSZ = 42
FUDGE = 2

Random.srand(0)

Blank    = [' ']
Fourths  = '▖▗▘▝░'.split ''
Halves   = '▀▄▌▐▚▞▒'.split ''
Trequads = '▙▛▜▟▓'.split ''
Full     = ['█']

def choose n
  case n
  when 0
    Blank[0]
  when 1
    Fourths[Random.rand(Fourths.length)]
  when 2
    Halves[Random.rand(Halves.length)]
  when 3
    Trequads[Random.rand(Trequads.length)]
  when 4
    Full[0]
  end
end


lines = (YSZ + 1).times.map { |x|
  x -= (YSZ/2)
  x /= (YSZ/2).to_f
  (XSZ + 1).times.map { |y|
    y -= (XSZ/2)
    y /= (XSZ/2).to_f

    d = (x*x + y*y) ** 0.5

    d *= FUDGE

    q = Math.exp(-d*d)
  
    choose([Random.rand, Random.rand, Random.rand, Random.rand].map { |r| r < q }.count(true))
  }.join
}
puts lines
