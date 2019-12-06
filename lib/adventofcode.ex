Code.require_file("day1/day1.ex")
Code.require_file("day2/day2.ex")
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

  def write_solution(content, filename) do
    case File.open("../assets/" <> filename, [:write]) do
      {:ok, file} ->
        content
        |> Enum.each(fn(x) -> IO.write(file, Integer.to_string(x) <> "\n") end)
        File.close(file)
    end
  end

end

# Adventofcode.read_input("d1p1", ~r/\R/)
# |> Day1.part1()
# |> IO.puts()

# Adventofcode.read_input("d1p1")
# |> Day1.part2()
# |> IO.puts()

# Adventofcode.read_input("d2", ",")
# |> Day2.part1()
# |> IO.inspect()

Adventofcode.read_input("d2", ",")
|> Day2.part2()
|> IO.inspect()