defmodule Hangman.Game do
  defstruct(
    turns_left: 7,
    game_state: :initializing,
    letters: [],
    used: MapSet.new()
  )

  def new_game(word) do
    %Hangman.Game{
      letters: word |> String.codepoints
    }
  end

  def new_game() do
    new_game(Dictionary.random_word)
  end

  def make_move(%{game_state: state} = game, _) when state in [:won, :lost] do
    game
  end

  def make_move(game, guess) do
    accept_move(game, guess, MapSet.member?(game.used, guess))
  end

  def tally(game) do
    %{
      game_state: game.game_state,
      turns_left: game.turns_left,
      letters: game.letters |> reveal_guessed(game.used)
    }
  end

  defp reveal_guessed(letters, used) do
    letters
    |> Enum.map(fn(letter) -> reveal_letter(letter, MapSet.member?(used, letter)) end)
  end

  defp reveal_letter(letter, true), do: letter
  defp reveal_letter(_, _), do: "_"

  defp accept_move(game, _guess, true) do
    Map.put(game, :game_state, :already_used)
  end

  defp accept_move(game, guess, false) do
    Map.put(game, :used, MapSet.put(game.used, guess))
    |> score_guess(Enum.member?(game.letters, guess))
  end

  defp score_guess(game, true) do
    new_state = MapSet.new(game.letters)
    |> MapSet.subset?(game.used)
    |> maybe_won()
    Map.put(game, :game_state, new_state)
  end

  defp score_guess(%{turns_left: 1} = game, _) do
    %{game| game_state: :lost}
  end

  defp score_guess(%{turns_left: turns_left} = game, _) do
    %{
      game|
      game_state: :bad_guess,
      turns_left: turns_left - 1
    }
  end

  defp maybe_won(true), do: :won
  defp maybe_won(_), do: :good_guess

end