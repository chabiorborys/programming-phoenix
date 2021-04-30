defmodule Rumbl.Video do
  @moduledoc """
  The Video context.
  """

  import Ecto.Query, warn: false
  alias Rumbl.Repo

  alias Rumbl.Video.Video

  @doc """
  Returns the list of user_id.

  ## Examples

      iex> list_user_id()
      [%Videos{}, ...]

  """
  def list_user_id do
    Repo.all(Video)
  end

  @doc """
  Gets a single videos.

  Raises `Ecto.NoResultsError` if the Videos does not exist.

  ## Examples

      iex> get_videos!(123)
      %Videos{}

      iex> get_videos!(456)
      ** (Ecto.NoResultsError)

  """
  def get_videos!(id), do: Repo.get!(Video, id)

  @doc """
  Creates a videos.

  ## Examples

      iex> create_videos(%{field: value})
      {:ok, %Videos{}}

      iex> create_videos(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_videos(attrs \\ %{}) do
    %Video{}
    |> Video.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a videos.

  ## Examples

      iex> update_videos(videos, %{field: new_value})
      {:ok, %Video{}}

      iex> update_videos(videos, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_videos(%Video{} = videos, attrs) do
    videos
    |> Video.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a videos.

  ## Examples

      iex> delete_videos(videos)
      {:ok, %Video{}}

      iex> delete_videos(videos)
      {:error, %Ecto.Changeset{}}

  """
  def delete_videos(%Video{} = videos) do
    Repo.delete(videos)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking videos changes.

  ## Examples

      iex> change_videos(videos)
      %Ecto.Changeset{source: %Video{}}

  """
  def change_videos(%Video{} = videos) do
    Video.changeset(videos, %{})
  end


  @doc """
  Returns the list of videos.

  ## Examples

      iex> list_videos()
      [%Video{}, ...]

  """
  def list_videos do
    Repo.all(Video)
  end

  @doc """
  Gets a single videos.

  Raises `Ecto.NoResultsError` if the Videos does not exist.

  ## Examples

      iex> get_videos!(123)
      %Videos{}

      iex> get_videos!(456)
      ** (Ecto.NoResultsError)

  """

end
