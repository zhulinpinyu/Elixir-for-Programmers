defmodule Hangman.Game do
  defstruct(
    turns_left: 7,
    game_state: :initializing,
    letters: [],
    used: MapSet.new()
  )

  def new_game() do
    %Hangman.Game{
      letters: Dictionary.random_word |> String.codepoints
    }
  end

  def make_move(%{game_state: state} = game, _) when state in [:won, :lost] do
    {game, tally(game)}
  end

  def make_move(game, guess) do
    game = accept_move(game, guess, MapSet.member?(game.used, guess))
    {game, tally(game)}
  end

  def accept_move(game, _guess, true) do
    Map.put(game, :game_state, :already_used)
  end

  def accept_move(game, guess, false) do
    Map.put(game, :used, MapSet.put(game.used, guess))
  end

  defp tally(_game) do
    123
  end
end