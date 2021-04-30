defmodule Rumbl.Video.Video do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Rumbl.Permalink, autogenerate: true}

  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string
    field :user_id, :id
    field :slug, :string
    belongs_to :category, Rumbl.Category
    has_many :annotations, Rumbl.Annotations.Annotation

    timestamps()
  end

  @required_fields ~w(category_id)

  @doc false
  def changeset(videos, attrs \\ %{}) do
    videos
    |> cast(attrs, [:url, :title, :description])
    |> validate_required([:url, :title, :description])
    |> slugify_title()
    |> assoc_constraint(:category)
  end

  defp slugify_title(changeset) do
    if title = get_change(changeset, :title) do
      put_change(changeset, :slug, slugify(title))
    else
      changeset
    end
  end

  defp slugify(str) do
    str
    |> String.downcase()
    |> String.replace(~r/[^\w-]+/u, "-")
  end

  defimpl Phoenix.Param, for: Rumbl.Video.Video do
    def to_param(%{slug: slug, id: id}) do
      "#{id}-#{slug}"
    end
  end

end
