defmodule SocketGallowsWeb.HangmanChannel do

  use Phoenix.Channel

  def join("hanman:game", _, socket) do
    {:ok, socket}
  end
end