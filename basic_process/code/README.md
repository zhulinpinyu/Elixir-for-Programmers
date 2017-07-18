## basic process
#### MFA --- module, function, arguments

#### F --- function

```elixir
# run in iex
c "proc.exs"
spawn Procs, :greeter, ["mlx"]

spawn(fn -> IO.puts "Hi Process" end)

# create 100 process
Enum.each(1..1000, fn _ -> spawn(fn -> Process.sleep(5000) end) end)

:observer.start()
```

## Sending and Receiving Messages

```elixir
pid = spawn Procs, :greeter, []
send pid, "wonder man"
```