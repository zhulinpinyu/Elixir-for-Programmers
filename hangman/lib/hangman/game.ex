defmodule Hangman.Game do
  defstruct(
    turns_left: 7,
    game_state: :initializing,
    letters: []
  )

  def new_game() do
    %Hangman.Game{
      letters: Dictionary.random_word |> String.codepoints
    }
  end

  def make_move(%{game_state: state} = game, _) when state in [:won, :lost] do
    {game, tally(game)}
  end

  defp tally(_game) do
    123
  end
end