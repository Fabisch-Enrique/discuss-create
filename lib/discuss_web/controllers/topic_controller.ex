defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Topics

  def index(conn, _params) do
    topics = Topics.list()

    render(conn, "index.html", topics: topics)


  end
  def new(conn, _params) do

    changeset = Discuss.Topic.changeset(%Discuss.Topic{}, %{})
    render(conn, "form.html", changeset: changeset)

  end

  def create(conn, %{"topic" => topic}) do

    case Topics.create(topic) do
      {:ok, _topic} ->
        conn
        |> redirect(to: Routes.topic_path(conn, :index))


      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "form.html", changeset: changeset)

    end
  end

  def edit(conn, params) do
    conn
  end

  def show(conn, _params) do
    conn
  end


end
