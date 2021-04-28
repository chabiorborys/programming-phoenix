defmodule RumblWeb.WatchController do
  use RumblWeb, :controller

  alias Rumbl.Video.Videos

  def show(conn, %{"id" => id}) do
    video = Repo.get!(Videos, id)
    render conn, "show.html", video: video
  end
end
