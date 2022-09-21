defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Topic

  def index(conn, _params) do
    topics = Topic.list()

    render(conn, "index.html", topics: topics)


  end
  def new(conn, _params) do

    changeset = Topic.changeset(%Discuss.Topic{}, %{})
    render(conn, "form.html", [changeset: changeset, processor: Routes.topic_path(conn, :create)])

  end

  def create(conn, %{"topic" => topic}) do

    case Topic.create(topic) do
      {:ok, _topic} ->
        conn
        |> redirect(to: Routes.topic_path(conn, :index))


      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "form.html", changeset: changeset)

    end
  end

  def update(conn, %{"id" => topic_id, "topic" => topic}) do

    case Topic.update(topic_id, topic) do
      {:ok, _topic} ->
        conn
        |> redirect(to: Routes.topic_path(conn, :index))


      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "form.html", changeset: changeset)

    end
  end

  def edit(conn, %{"id" => topic_id}) do
    topic = Topic.get(topic_id)
    changeset = topic |> Topic.changeset()
    render(conn, "form.html", [changeset: changeset, processor: Routes.topic_path(conn, :update, topic)])
  end

  def show(conn, _params) do
    conn
  end


end
