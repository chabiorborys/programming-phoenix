defmodule Rumbl.UserTest do
  use Rumbl.DataCase, async: true
  alias Rumbl.User

  test "changeset with valid attribute" do
    valid_attrs = %{name: "A User", username: "eva", password: "secret"}
    changeset = User.changeset(%User{}, valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    invalid_attrs = %{names: "A User", username: "", password: "secret"}
    changeset = User.changeset(%User{}, invalid_attrs)
    refute changeset.valid?
  end

  test "changeset does not accept long username" do
    valid_attrs = %{name: "A User", username: "eva", password: "secret"}
    attrs = %{valid_attrs | username: String.duplicate("a", 30)}
    changeset = User.changeset(%User{}, attrs)
    assert %{username: ["should be at most 20 character(s)"]} = errors_on(changeset)
  end

  test "registration_changeset password must be at least 6 chars long" do
    valid_attrs = %{name: "A User", username: "eva", password: "12345"}
    changeset = User.registration_changeset(%User{}, valid_attrs)
    refute changeset.valid?
  end

  test "registration_changeset with valid attributes hashes password" do
    valid_attrs = %{name: "A User", username: "eva", password: "123456"}
    changeset = User.registration_changeset(%User{}, valid_attrs)
    IO.inspect(changeset)
    %{password: pass, password_hash: pass_hash} = changeset.changes
    assert changeset.valid?
    assert pass_hash
    IO.inspect(pass_hash)
    assert Comeonin.Bcrypt.checkpw(pass, pass_hash)
  end

end
