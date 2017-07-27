defmodule Chain do
  defstruct(
    next_node: nil,
    count: 4000
  )

  def start_link(next_node) do
    spawn_link(Chain, :message_loop, [%Chain{next_node: next_node}])
    |> Process.register(:chainer)
  end

  def message_loop(%{count: 0}) do
    IO.puts "Done"
  end

  def message_loop(state) do
    receive do
      {:trigger, list} ->
        IO.inspect list
        send {:chainer, state.next_node}, {:trigger, [node() | list]}
    end
    message_loop(%{state | count: state.count - 1})
  end
end

#示例
#开启四个node
#```
# iex --sname one chain.exs
# iex --sname two chain.exs
# iex --sname three chain.exs
# iex --sname four chain.exs
#```

# node 启动完成 在 node one two three four 分别运行：
# iex(one@LixiangMBP)1> Chain.start_link(:two@LixiangMBP)
# iex(two@LixiangMBP)4> Chain.start_link(:three@LixiangMBP)
# iex(three@LixiangMBP)4> Chain.start_link(:four@LixiangMBP)
# iex(four@LixiangMBP)4> Chain.start_link(:one@LixiangMBP)

#最后 选择任意node下运行，查看结果即可
# iex(one@LixiangMBP)3> send :chainer, {:trigger, []}

