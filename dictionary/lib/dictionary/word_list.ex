defmodule Dictionary.WordList do
  def start_link do
    Agent.start_link(fn -> word_list() end)
  end

  def word_list() do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end

  def random_word(agent) do
    Agent.get(agent, fn words -> Enum.random(words) end )
  end
end