defmodule TextClient.Summary do
  def display(state = %{tally: tally}) do
    IO.puts [
      "\n",
      "Word so far: #{Enum.join(tally.letters, "")}\n",
      "Guesses left: #{tally.turns_left}\n"
    ]
    state
  end
end