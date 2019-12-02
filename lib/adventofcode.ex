Code.require_file("day1/part1.ex")
defmodule Adventofcode do
  def read_input(name) do
    case File.read("../assets/" <> name) do
      {:ok, content} ->
        String.split(content, ~r/\R/)
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

Adventofcode.read_input("d1p1")
|> Day1.part1()
|> IO.puts()