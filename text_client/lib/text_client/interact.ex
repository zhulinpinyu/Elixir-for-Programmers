defmodule TextClient.Interact do
  def start do
    Hangman.new_game()
    |> setup_state()
    |> IO.inspect
  end

  def setup_state(game) do
    %TextClient.State{
      game_service: game,
      tally: Hangman.tally(game)
    }
  end

end