defmodule Rumbl.Annotation do
  @moduledoc """
  The Annotation context.
  """

  import Ecto.Query, warn: false
  alias Rumbl.Repo

  alias Rumbl.Annotation.Annotations

  @doc """
  Returns the list of annotations.

  ## Examples

      iex> list_annotations()
      [%Annotations{}, ...]

  """
  def list_annotations do
    Repo.all(Annotations)
  end

  @doc """
  Gets a single annotations.

  Raises `Ecto.NoResultsError` if the Annotations does not exist.

  ## Examples

      iex> get_annotations!(123)
      %Annotations{}

      iex> get_annotations!(456)
      ** (Ecto.NoResultsError)

  """
  def get_annotations!(id), do: Repo.get!(Annotations, id)

  @doc """
  Creates a annotations.

  ## Examples

      iex> create_annotations(%{field: value})
      {:ok, %Annotations{}}

      iex> create_annotations(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_annotations(attrs \\ %{}) do
    %Annotations{}
    |> Annotations.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a annotations.

  ## Examples

      iex> update_annotations(annotations, %{field: new_value})
      {:ok, %Annotations{}}

      iex> update_annotations(annotations, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_annotations(%Annotations{} = annotations, attrs) do
    annotations
    |> Annotations.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a annotations.

  ## Examples

      iex> delete_annotations(annotations)
      {:ok, %Annotations{}}

      iex> delete_annotations(annotations)
      {:error, %Ecto.Changeset{}}

  """
  def delete_annotations(%Annotations{} = annotations) do
    Repo.delete(annotations)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking annotations changes.

  ## Examples

      iex> change_annotations(annotations)
      %Ecto.Changeset{source: %Annotations{}}

  """
  def change_annotations(%Annotations{} = annotations) do
    Annotations.changeset(annotations, %{})
  end
end
