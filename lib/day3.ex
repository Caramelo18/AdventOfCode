defmodule Day3 do
    def get_move(mov) do
        dir = String.at(mov, 0)
        {num, _} = Integer.parse(String.slice(mov, 1..-1))
        [dir, num]
    end

    def get_path_aux([_str, 0], x, y, positions) do
        [x, y, positions]
    end

    def get_path_aux(["L", num], x, y, positions) do
        get_path_aux(["L", num - 1], x - 1, y, positions ++ [[x - 1, y]])
    end

    def get_path_aux(["R", num], x, y, positions) do
        get_path_aux(["R", num - 1], x + 1, y, positions ++ [[x + 1, y]])
    end

    def get_path_aux(["U", num], x, y, positions) do
        get_path_aux(["U", num - 1], x, y + 1, positions ++ [[x, y + 1]])
    end

    def get_path_aux(["D", num], x, y, positions) do
        get_path_aux(["D", num - 1], x, y - 1, positions ++ [[x, y - 1]])
    end

    def get_path([], _x, _y, positions) do
        positions
    end

    def get_path([move | tail], x, y, positions) do
        [new_x, new_y, new_positions] = get_path_aux(get_move(move), x, y, positions)
        get_path(tail, new_x, new_y, new_positions)
    end

    def get_path(mov) do
        get_path(mov, 0, 0, [])
    end

    def part1([mov1, mov2]) do
        pos_cab1 = get_path(mov1)
        pos_cab2 = get_path(mov2)
        
        MapSet.to_list(MapSet.intersection(Enum.into(pos_cab1, MapSet.new), Enum.into(pos_cab2, MapSet.new)))
        |> Enum.map(fn [x, y] -> abs(x) + abs(y) end)
        |> Enum.min()
    end

end
  