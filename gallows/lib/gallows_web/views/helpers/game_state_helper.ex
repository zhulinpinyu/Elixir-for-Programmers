defmodule GallowsWeb.Views.Helpers.GameStateHelper do
  import Phoenix.HTML, only: [raw: 1]

  @responses %{
    :won => {:success, "You Won!"},
    :lost => {:danger, "You Lost!"},
    :good_guess => {:success, "Good Guess"},
    :bad_guess => {:warning, "Bad Guess"},
    :already_used => {:info, "You already guessed that"}
  }

  def game_state(state) do
    @responses[state]
    |> alert()
  end

  defp alert(nil), do: ""
  defp alert({class, msg}) do
    """
    <div class="alert alert-#{class}">
      #{msg}
    </div>
    """
    |> raw()
  end
end