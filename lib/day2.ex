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

    def part1_aux(arg, _arg, _index) do
        arg
    end

    def part1(arg) do
        part1_aux(arg, arg, 0)
    end

    def part2_aux([19690720, noun, verb | _tail]) do
        [19690720, noun, verb]
    end

    def part2_aux([_result, 99, 99 | _tail]) do
        IO.puts("duck")
    end

    def part2_aux([_result, noun, 99 | tail]) do
        [result1 | _tail_res] = part1([1, noun + 1, 0 | tail])
        part2_aux([result1, noun + 1, 0 | tail])
    end

    def part2_aux([_result, noun, verb | tail]) do
        [result1 | _tail_res] = part1([1, noun, verb + 1 | tail])
        part2_aux([result1, noun, verb + 1 | tail])
    end

    def part2([_result, _noun, _verb | tail]) do
        [result, noun, verb] = part2_aux([1, 0, 0 | tail])
        IO.puts(result)
        IO.puts(noun)
        IO.puts(verb)
        100* noun + verb
    end
end
  