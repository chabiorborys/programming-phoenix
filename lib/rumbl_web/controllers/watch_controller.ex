defmodule RumblWeb.WatchController do
  use RumblWeb, :controller

  alias Rumbl.Video.Video

  def show(conn, %{"id" => id}) do
    video = Repo.get!(Video, id)
    render conn, "show.html", video: video
  end
end
