defmodule GallowsWeb.HangmanView do
  use GallowsWeb, :view

  import GallowsWeb.Views.Helpers.GameStateHelper

  def game_over?(%{game_state: game_state}) do
    game_state in [:lost, :won]
  end

  def new_game_button(conn) do
    button("New Game", class: "btn btn-default", to: hangman_path(conn, :create_game))
  end
end
