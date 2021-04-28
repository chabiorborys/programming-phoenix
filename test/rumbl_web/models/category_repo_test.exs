defmodule Rumbl.CategoryRepoTest do
  use Rumbl.DataCase
  alias Rumbl.Category

  test "alphabetical/1 order by name" do
    Repo.insert!(%Category{name: "c"})
    Repo.insert!(%Category{name: "a"})
    Repo.insert!(%Category{name: "b"})

    query = Category |> Category.alphabetical()
    query = from c in query, select: c.name
    IO.inspect(Repo.all(query))
    assert Repo.all(query) == ~w(a Action b c Comedy Drama Romanace Sci-fi)
  end
end
