defmodule Dictionary do

  def random_word do
    word_list() |> Enum.random
  end

  def word_list do
    File.read!('./assets/words.txt')
    |> String.split(~r/\n/)
  end
end
