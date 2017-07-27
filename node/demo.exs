defmodule Demo do
  def reverse do
    receive do
      {from_pid, msg} ->
        ret = msg |> String.reverse
        send from_pid, ret
        reverse()
    end
  end
end