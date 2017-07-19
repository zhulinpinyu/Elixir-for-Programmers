defmodule HitCount do
  def start() do
    Agent.start_link(fn -> 0 end)
  end

  def record_hit(agent) do
    Agent.update(agent, &(&1 + 1))
  end

  def get_count(agent) do
    Agent.get(agent, &(&1))
  end
end

{:ok, agent} = HitCount.start()

IO.puts HitCount.record_hit(agent)
IO.puts HitCount.get_count(agent)

IO.puts HitCount.record_hit(agent)
IO.puts HitCount.get_count(agent)