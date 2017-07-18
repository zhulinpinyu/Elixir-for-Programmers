defmodule Proc do
  def greeter(name) do
    Process.sleep(1000)
    IO.puts "Hi #{name}"
  end
end

#MFA --- module, function, arguments
spawn Proc, :greeter, ["mlx"]

#F --- function

spawn(fn -> IO.puts "Hi Process" end)


# run in iex
# c "proc.exs"
# spawn Proc, :greeter, ["mlx"]

# spawn(fn -> IO.puts "Hi Process" end)