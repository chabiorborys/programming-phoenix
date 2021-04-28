defmodule Rumbl.Video do
  @moduledoc """
  The Video context.
  """

  import Ecto.Query, warn: false
  alias Rumbl.Repo

  alias Rumbl.Video.Videos

  @doc """
  Returns the list of user_id.

  ## Examples

      iex> list_user_id()
      [%Videos{}, ...]

  """
  def list_user_id do
    Repo.all(Videos)
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
  def get_videos!(id), do: Repo.get!(Videos, id)

  @doc """
  Creates a videos.

  ## Examples

      iex> create_videos(%{field: value})
      {:ok, %Videos{}}

      iex> create_videos(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_videos(attrs \\ %{}) do
    %Videos{}
    |> Videos.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a videos.

  ## Examples

      iex> update_videos(videos, %{field: new_value})
      {:ok, %Videos{}}

      iex> update_videos(videos, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_videos(%Videos{} = videos, attrs) do
    videos
    |> Videos.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a videos.

  ## Examples

      iex> delete_videos(videos)
      {:ok, %Videos{}}

      iex> delete_videos(videos)
      {:error, %Ecto.Changeset{}}

  """
  def delete_videos(%Videos{} = videos) do
    Repo.delete(videos)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking videos changes.

  ## Examples

      iex> change_videos(videos)
      %Ecto.Changeset{source: %Videos{}}

  """
  def change_videos(%Videos{} = videos) do
    Videos.changeset(videos, %{})
  end

  alias Rumbl.Video.Videos

  @doc """
  Returns the list of videos.

  ## Examples

      iex> list_videos()
      [%Videos{}, ...]

  """
  def list_videos do
    Repo.all(Videos)
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
