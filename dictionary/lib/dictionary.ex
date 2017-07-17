defmodule Dictionary do

  defdelegate start(), to: Dictionary.WordList

  def random_word do
    start()
    |> Enum.random
  end
end
