defmodule Rumbl.VideoViewTest do
  use RumblWeb.ConnCase, async: true
  import Phoenix.View

  test "renders index.html", %{conn: conn} do
    videos = [%Rumbl.Video.Videos{id: "1", title: "dogs"},
              %Rumbl.Video.Videos{id: "2", title: "cats"}]
    content = render_to_string(RumblWeb.VideosView, "index.html",
                                conn: conn, videos: videos)

    assert String.contains?(content, "Listing Videos")
    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end

  test "renders new.html", %{conn: conn} do
    changeset = Rumbl.Video.Videos.changeset(%Rumbl.Video.Videos{})
    categories = []
    content = render_to_string(RumblWeb.VideosView, "new.html",
      conn: conn, changeset: changeset, categories: categories)
      assert String.contains?(content, "New Videos")
  end

end
