defmodule TextClient.Player do

  alias TextClient.{Prompter, Summary, State}

  def play(%State{tally: %{game_state: :won}}) do
    exit_with_message("You are Won!")
  end

  def play(%State{tally: %{game_state: :lost}}) do
    exit_with_message("Sorry, You are lost!")
  end

  def play(%State{tally: %{game_state: :good_guess}} = state) do
    continue_with_message(state, "Good guess, continue")
  end

  def play(%State{tally: %{game_state: :bad_guess}} = state) do
    continue_with_message(state, "Sorry, that is not in the word")
  end

  def play(%State{tally: %{game_state: :already_used}} = state) do
    continue_with_message(state, "Sorry, that already be used")
  end

  def play(state) do
    continue(state)
  end

  defp exit_with_message(msg) do
    IO.puts msg
    exit(:normal)
  end

  defp continue(state) do
    state
    |> Summary.display()
    |> Prompter.accept_move()
    |> make_move()
    |> play()
  end


  defp make_move(state)  do
    state
  end

  defp continue_with_message(state, msg) do
    IO.puts msg
    continue(state)
  end
end