defmodule Discuss.Topics do
  alias Discuss.Topic
  alias Discuss.Repo

  def list do
    Repo.all(Discuss.Topic)
  end

  def create(attrs) do
    Topic.changeset(%Topic{}, attrs) |> Repo.insert()
  end

  def update do

  end

  def delete do

  end

  def get(id) do

  end


end
