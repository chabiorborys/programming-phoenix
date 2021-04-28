defmodule Rumbl.UserRepoTest do
  use Rumbl.DataCase
  alias Rumbl.User

  test "converts unique_constraint on username to error" do
    valid_attrs = %{name: "Name", username: "A User", password: "123456"}
    insert_user(username: "Eman")
    attrs = Map.put(valid_attrs, :username, "Eman")
    changeset = User.changeset(%User{}, attrs)

    assert {:error, changeset} = Repo.insert(changeset)
    assert %{username: ["has already been taken"]} = errors_on(changeset)
  end



end
