defmodule DiscussWeb.TopicView do
  use DiscussWeb, :view

  def caps(s) do
    IO.inspect(s)
    String.upcase(s) |> IO.inspect()
  end
end
