defmodule TextClient.Mover do

  alias TextClient.State

  def make_move(state) do
    {gs, tally} = Hangman.make_move(state.game_service, state.guess)
    %State{state| game_service: gs, tally: tally}
  end
end