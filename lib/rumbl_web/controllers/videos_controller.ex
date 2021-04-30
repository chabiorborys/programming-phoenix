defmodule RumblWeb.VideosController do
  use RumblWeb, :controller

  alias Rumbl.Video.Video
  alias Rumbl.Category

  plug :load_categories when action in [:new, :create, :edit, :update]


  def action(conn, _) do
    apply(__MODULE__, action_name(conn),
          [conn, conn.params, conn.assigns.current_user])
  end

  def index(conn, _params, user) do
    videos = Repo.all(user_videos(user))
    render(conn, "index.html", videos: videos)
  end

  def new(conn, _params, user) do
    changeset =
      user
      |> build_assoc(:videos)
      |> Video.changeset()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"videos" => videos_params}, user) do
    changeset =
      user
      |> build_assoc(:videos)
      |> Video.changeset(videos_params)

    case Repo.insert(changeset) do
      {:ok, videos} ->
        conn
        |> put_flash(:info, "Videos created successfully.")
        |> redirect(to: Routes.videos_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}, user) do
    videos = Repo.get!(user_videos(user), id)
    render(conn, "show.html", videos: videos)
  end

  def edit(conn, %{"id" => id}, user) do
    videos = Repo.get!(user_videos(user), id)
    changeset = Video.changeset(videos)
    render(conn, "edit.html", videos: videos, changeset: changeset)
  end

  def update(conn, %{"id" => id, "videos" => videos_params}, user) do
    videos = Repo.get!(user_videos(user), id)
    changeset = Video.changeset(videos, videos_params)

    case Repo.update(changeset) do
      {:ok, videos} ->
        conn
        |> put_flash(:info, "Videos updated successfully.")
        |> redirect(to: Routes.videos_path(conn, :show, videos))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", videos: videos, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}, user) do
    videos = Repo.get!(user_videos(user), id)
    Repo.delete!(videos)

    conn
    |> put_flash(:info, "Videos deleted successfully.")
    |> redirect(to: Routes.videos_path(conn, :index))
  end

  defp user_videos(user) do
    assoc(user, :videos)
  end

  defp load_categories(conn, _) do
    query =
      Category
      |> Category.alphabetical
      |> Category.names_and_ids
    categories = Repo.all query
    assign(conn, :categories, categories)
  end

end
