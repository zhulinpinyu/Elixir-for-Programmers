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

## Linking Our Fate to Our Children's Fate

spawn 开启独立process
spawn_link 开启的是child process, 只要一个非正常挂掉，另一个也随之被kill

```elixir
# 增加100个process 10秒后结束
inner_process = fn -> Process.sleep(10_000) end
outer_process = fn -> spawn(inner_process); exit(:bad) end
Enum.each(1..100, fn _ -> spawn(outer_process) end)
################

#process 数量不变：原因就是spawn_link
inner_process = fn -> Process.sleep(10_000) end
outer_process = fn -> spawn_link(inner_process); exit(:bad) end
Enum.each(1..100, fn _ -> spawn(outer_process) end)
```

