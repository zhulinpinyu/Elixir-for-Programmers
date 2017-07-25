# Hangman 

This Commit Use Case [https://github.com/zhulinpinyu/Elixir-for-Programmers/tree/0bcba6290171f8265e3ec122546e3efca0d3844d/hangman](https://github.com/zhulinpinyu/Elixir-for-Programmers/tree/0bcba6290171f8265e3ec122546e3efca0d3844d/hangman)

```elixir
iex -S mix
iex(1)> {:ok, pid} = Hangman.new_game()
{:ok, #PID<0.134.0>}
iex(2)> Hangman.make_move(pid, "a")
%{game_state: :bad_guess, letters: ["_", "_", "_", "_", "_"], turns_left: 6}
iex(3)> Hangman.make_move(pid, "s")
%{game_state: :good_guess, letters: ["s", "_", "_", "_", "_"], turns_left: 6}
iex(4)> Hangman.make_move(pid, "t")
%{game_state: :bad_guess, letters: ["s", "_", "_", "_", "_"], turns_left: 5}
iex(5)> Hangman.make_move(pid, "e")

...
```
