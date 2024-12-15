-module(sudoku_solver).
-export([solve/1]).

% Solve a Sudoku puzzle
solve(Grid) ->
    case solve_puzzle(Grid) of
        {ok, SolvedGrid} ->
            io:format("Solved Sudoku:~n"),
            print_grid(SolvedGrid),
            ok; % Return a simple "ok" instead of the grid
        error ->
            io:format("No solution found.~n"),
            error
    end.

% Recursive solver
solve_puzzle(Grid) ->
    case find_empty_cell(Grid) of
        none -> {ok, Grid}; % Base case: no empty cells, puzzle solved
        {Row, Col} ->
            try_numbers(Row, Col, Grid)
    end.

% Try numbers 1-9 in the empty cell
try_numbers(Row, Col, Grid) ->
    lists:foldl(fun(Num, Acc) ->
        case Acc of
            {ok, _} -> Acc; % Stop if solution found
            error ->
                case is_valid(Row, Col, Num, Grid) of
                    true ->
                        NewGrid = fill_cell(Row, Col, Num, Grid),
                        solve_puzzle(NewGrid);
                    false ->
                        error
                end
        end
    end, error, lists:seq(1, 9)).

% Find the first empty cell in the grid
find_empty_cell(Grid) ->
    find_empty_cell(Grid, 0).

find_empty_cell([], _) -> none;
find_empty_cell([Row | Rest], RowIdx) ->
    case find_empty_in_row(Row, 0) of
        none -> find_empty_cell(Rest, RowIdx + 1);
        Col -> {RowIdx, Col}
    end.

find_empty_in_row([], _) -> none;
find_empty_in_row([Cell | Rest], ColIdx) ->
    case Cell of
        0 -> ColIdx;
        _ -> find_empty_in_row(Rest, ColIdx + 1)
    end.

% Check if a number can be placed in the cell
is_valid(Row, Col, Num, Grid) ->
    not lists:member(Num, row_values(Row, Grid)) andalso
    not lists:member(Num, col_values(Col, Grid)) andalso
    not lists:member(Num, box_values(Row, Col, Grid)).

% Fill a cell with a number
fill_cell(Row, Col, Num, Grid) ->
    lists:sublist(Grid, Row) ++
    [lists:sublist(lists:nth(Row + 1, Grid), Col) ++ [Num] ++ lists:nthtail(Col + 1, lists:nth(Row + 1, Grid))] ++
    lists:nthtail(Row + 1, Grid).

% Extract row values
row_values(Row, Grid) ->
    lists:nth(Row + 1, Grid).

% Extract column values
col_values(Col, Grid) ->
    [lists:nth(Col + 1, Row) || Row <- Grid].

% Extract box values
box_values(Row, Col, Grid) ->
    BoxRowStart = (Row div 3) * 3,
    BoxColStart = (Col div 3) * 3,
    [lists:nth(BoxColStart + ColIdx + 1, lists:nth(BoxRowStart + RowIdx + 1, Grid))
     || RowIdx <- lists:seq(0, 2), ColIdx <- lists:seq(0, 2)].

% Print the Sudoku grid
print_grid(Grid) ->
    lists:foreach(fun(Row) ->
        io:format("~p~n", [Row])
    end, Grid).
