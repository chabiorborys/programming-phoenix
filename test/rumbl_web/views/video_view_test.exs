defmodule Rumbl.VideoViewTest do
  use RumblWeb.ConnCase, async: true
  import Phoenix.View

  test "renders index.html", %{conn: conn} do
    videos = [%Rumbl.Video.Video{id: "1", title: "dogs"},
              %Rumbl.Video.Video{id: "2", title: "cats"}]
    content = render_to_string(RumblWeb.VideoView, "index.html",
                                conn: conn, videos: videos)

    assert String.contains?(content, "Listing Videos")
    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end

  test "renders new.html", %{conn: conn} do
    changeset = Rumbl.Video.Video.changeset(%Rumbl.Video.Video{})
    categories = []
    content = render_to_string(RumblWeb.VideoView, "new.html",
      conn: conn, changeset: changeset, categories: categories)
      assert String.contains?(content, "New Video")
  end

end
