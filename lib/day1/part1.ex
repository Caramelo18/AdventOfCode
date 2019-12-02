defmodule Day1 do
  def module_fuel(arg) do
    div(arg, 3)
    |> Kernel.-(2)
  end
  
  def part1(arg) do
    arg
    |> Enum.map(fn n -> module_fuel(n) end)
    |> Enum.sum()
  end

  def part2_aux(arg) do
    case module_fuel(arg) do
      n when n > 0 -> 
        arg + part2_aux(n)
      n when n <= 0 ->
        arg
    end
  end

  def part2(arg) do
    arg
    |> Enum.map(fn n -> part2_aux(module_fuel(n)) end)
    |> Enum.sum()
  end
end
