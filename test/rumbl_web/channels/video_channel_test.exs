defmodule Rumbl.Channels.VideoChannelTest do
  use RumblWeb.ChannelCase
  import RumblWeb.TestHelpers

  setup do
    user = insert_user(name: "Rebecca")
    video = insert_video(user, title: "Testing")
    token = Phoenix.Token.sign(@endpoint, "user socket", user.id)
    {:ok, socket} = connect(RumblWeb.UserSocket, %{"token" => token})


    {:ok, socket: socket, user: user, video: video}
  end

  test "join replies with video annotations", %{socket: socket, video: vid} do
    for body <- ~w(one two) do
      vid
      |> Ecto.build_assoc(:annotations, %{body: body})
      |> Repo.insert()
    end
    {:ok, reply, socket} = subscribe_and_join(socket, "videos:#{vid.id}", %{})

    assert socket.assigns.video_id == vid.id
    assert %{annotations: [%{body: "one"}, %{body: "two"}]} = reply
  end

  test "insertying new annotations", %{socket: socket, video: vid} do
    {:ok, _, socket} = subscribe_and_join(socket, "videos:#{vid.id}", %{})
    ref = push socket, "new_annotation", %{body: "the body", at: 0}
    assert_reply ref, :ok, %{}
    assert_broadcast "new_annotation", %{}
  end
end
