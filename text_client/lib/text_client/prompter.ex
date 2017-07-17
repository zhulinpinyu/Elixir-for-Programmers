defmodule TextClient.Prompter do
  def accept_move(state) do
    IO.gets("Your Guess: ")
    |> check_input(state)
  end

  defp check_input({:error, reason}, _) do
    IO.puts "Game ended of #{reason}"
    exit(:normal)
  end

  defp check_input(:eof, _) do
    IO.puts "Looks like you gave up ..."
    exit(:normal)
  end

  defp check_input(input, state) do
    input = String.trim(input)
    cond do
      input =~ ~r/\A[a-z]\z/ ->
        %{state | guess: input}
      true ->
        IO.puts "Pls input single lowcase letter"
        accept_move(state)
    end
  end
end