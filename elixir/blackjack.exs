_ = """
Challenge name: BlackJack II
Challenge link: https://www.learneroo.com/modules/20/nodes/144
Completed by Zack Sargent on: March/11/2021
Notes: I'm really just trying to learn elixir
Resources: https://gist.github.com/fschuindt/d1174ac8f490bfdef8abf9629fa8ecaf

To run this code, do `elixir blackjack.exs`
"""

defmodule BlackJack do
  def solve(a,11) when 1 + a <= 21, do: a + 1
  def solve(11,b) when 1 + b <= 21, do: b + 1
  def solve(a,b) when a + b > 21, do: 0
  def solve(a,b), do: a + b
end

IO.puts BlackJack.solve(4, 3) # = 7
IO.puts BlackJack.solve(20, 11) # = 21
IO.puts BlackJack.solve(21, 11) # = 0

