#! /usr/bin/ruby

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

lines = 51.times.map { |x|
  x -= 25
  x /= 25.0
  51.times.map { |y|
    y -= 25
    y /= 25.0

    d = (x*x + y*y) ** 0.5

    m = 4 - (d*4).round(half: [:down, :up][Random.rand(2)])

    q = [m+1, m, m-1].reject(&:negative?)

    q << 0 if q.empty?

    choose q[Random.rand(q.length)]
  }.join
}
puts lines
