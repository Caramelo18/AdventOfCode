defmodule Day1 do
  def part1_aux(arg) do
    div(arg, 3)
    |> Kernel.-(2)
  end
  
  def part1(arg) do
    arg
    |> Enum.map(fn n -> part1_aux(n) end)
    |> Enum.sum()
  end
end
