defmodule Lists do
  def len([]), do: 0
  def len([_|t]), do: 1 + len(t)

  def sum([]), do: 0
  def sum([h|t]), do: h + sum(t)

  def double([]), do: []
  def double([h|t]), do: [h * 2 | double(t)]

  def square([]), do: []
  def square([h|t]), do: [h * h | square(t)]

  def sum_pairs([]), do: []
  def sum_pairs([h1, h2|t]), do: [h1 + h2 | sum_pairs(t)]
  def sum_pairs([h1|t]), do: [h1 | sum_pairs(t)]

  def even_length?(list), do: len(list) |> rem(2) == 0
end

IO.puts "Lists.len/1"
IO.puts Lists.len([])
IO.puts Lists.len([1,2,3])

IO.puts "Lists.sum/1"
IO.puts Lists.sum([])
IO.puts Lists.sum([1,2,3])

IO.puts "Lists.double/1"
IO.inspect Lists.double([])
IO.inspect Lists.double([1,2,3])

IO.puts "Lists.square/1"
IO.inspect Lists.square([])
IO.inspect Lists.square([1,2,3])

IO.puts "Lists.sum_pairs/1"
IO.inspect Lists.sum_pairs([])
IO.inspect Lists.sum_pairs([1,2,3])
IO.inspect Lists.sum_pairs([1,2,3,4])

IO.puts "Lists.even_length?/1"
IO.inspect Lists.even_length?([])
IO.inspect Lists.even_length?([1,2,3])
IO.inspect Lists.even_length?([1,2,3,4])