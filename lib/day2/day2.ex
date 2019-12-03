defmodule Day2 do
    def part1_aux([1, arg1, arg2, dest | _tail], list, index) do
        new_list = List.replace_at(list, dest, Enum.at(list, arg1) + Enum.at(list, arg2))
        {_, to_process} = Enum.split(new_list, index + 4)
        part1_aux(to_process, new_list, index + 4)
    end

    def part1_aux([2, arg1, arg2, dest | _tail], list, index) do
        new_list = List.replace_at(list, dest, Enum.at(list, arg1) * Enum.at(list, arg2))
        {_, to_process} = Enum.split(new_list, index + 4)
        part1_aux(to_process, new_list, index + 4)
    end

    def part1_aux([99 | _tail], list, _index) do
        list
    end

    def part1(arg) do
        part1_aux(arg, arg, 0)
        |> IO.inspect()
    end
end
  