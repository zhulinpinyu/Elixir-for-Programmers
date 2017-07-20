defmodule Dictionary.Application do
  def start(_type, _arg) do
    Dictionary.WordList.start_link()
  end
end