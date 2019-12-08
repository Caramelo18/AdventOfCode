Code.require_file("day1.ex")
Code.require_file("day2.ex")
Code.require_file("day3.ex")
defmodule Adventofcode do
  def read_input(name, pattern) do
    case File.read("../assets/" <> name) do
      {:ok, content} ->
        String.split(content, pattern)
        |> Enum.reverse() |> tl() |> Enum.reverse()
        |> Enum.map(fn n -> Integer.parse(n) |> elem(0) end)
      {:error, reason} ->
        IO.puts(reason)
    end
  end

  def read_input([list1, list2]) do
    new_l1 = String.split(list1, ",")
    new_l2 = String.split(list2, ",")
    [new_l1, new_l2]
  end
  
  def read_input(name) do
    case File.read("../assets/" <> name) do
      {:ok, content} ->
        String.split(content , ~r/\R/)
        |> Enum.reverse() |> tl() |> Enum.reverse()
        |> read_input()
      {:error, reason} ->
        IO.puts(reason)
    end
  end  

  def write_solution(content, filename) do
    case File.open("../assets/" <> filename, [:write]) do
      {:ok, file} ->
        content
        |> Enum.each(fn(x) -> IO.write(file, Integer.to_string(x) <> "\n") end)
        File.close(file)
    end
  end

end

# Adventofcode.read_input("d1", ~r/\R/)
# |> Day1.part1()
# |> IO.puts()

# Adventofcode.read_input("d1", ~r/\R/)
# |> Day1.part2()
# |> IO.puts()

# Adventofcode.read_input("d2", ",")
# |> Day2.part1()
# |> IO.inspect()

# Adventofcode.read_input("d2", ",")
# |> Day2.part2()
# |> IO.inspect()

# Adventofcode.read_input("d3")
# |> Day3.part1()
# |> IO.inspect()

# Day3.part1([["R8","U5","L5","D3"], ["U7","R6","D4","L4"]])
# |> IO.inspect()

# Day3.part1([["R75","D30","R83","U83","L12","D49","R71","U7","L72"],["U62","R66","U55","R34","D71","R55","D58","R83"]])

# Day3.part1([["R98","U47","R26","D63","R33","U87","L62","D20","R33","U53","R51"],["U98","R91","D20","R16","D67","R40","U7","R15","U6","R7"]])