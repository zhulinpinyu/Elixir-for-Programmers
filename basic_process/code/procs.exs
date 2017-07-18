defmodule Procs do
  def greeter() do
    receive do
      msg ->
        IO.puts "Hi #{IO.inspect msg}"
    end
    greeter()
  end
end