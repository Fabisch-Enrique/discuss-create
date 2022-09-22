defmodule Discuss.Topic  do
  use Ecto.Schema

  import Ecto.Changeset

  alias Discuss.Repo

  schema "topics" do
    field :title, :string
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_length(:title, min: 4, max: 100)
  end

  def list do
    Repo.all(__MODULE__)
  end

  def create(attrs) do
    changeset(%__MODULE__{}, attrs) |> Repo.insert()
  end

  def update(id, attrs) do
    get(id) |> changeset(attrs) |> Repo.update()
  end

  def delete(id) do
    get(id) |> Repo.delete()
  end

  def get(id) do
    Repo.get!(__MODULE__, id)
  end


end
