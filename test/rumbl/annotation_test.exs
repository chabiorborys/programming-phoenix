defmodule Rumbl.AnnotationTest do
  use Rumbl.DataCase

  alias Rumbl.Annotation

  describe "annotations" do
    alias Rumbl.Annotation.Annotations

    @valid_attrs %{at: 42, body: "some body"}
    @update_attrs %{at: 43, body: "some updated body"}
    @invalid_attrs %{at: nil, body: nil}

    def annotations_fixture(attrs \\ %{}) do
      {:ok, annotations} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Annotation.create_annotations()

      annotations
    end

    test "list_annotations/0 returns all annotations" do
      annotations = annotations_fixture()
      assert Annotation.list_annotations() == [annotations]
    end

    test "get_annotations!/1 returns the annotations with given id" do
      annotations = annotations_fixture()
      assert Annotation.get_annotations!(annotations.id) == annotations
    end

    test "create_annotations/1 with valid data creates a annotations" do
      assert {:ok, %Annotations{} = annotations} = Annotation.create_annotations(@valid_attrs)
      assert annotations.at == 42
      assert annotations.body == "some body"
    end

    test "create_annotations/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Annotation.create_annotations(@invalid_attrs)
    end

    test "update_annotations/2 with valid data updates the annotations" do
      annotations = annotations_fixture()
      assert {:ok, %Annotations{} = annotations} = Annotation.update_annotations(annotations, @update_attrs)
      assert annotations.at == 43
      assert annotations.body == "some updated body"
    end

    test "update_annotations/2 with invalid data returns error changeset" do
      annotations = annotations_fixture()
      assert {:error, %Ecto.Changeset{}} = Annotation.update_annotations(annotations, @invalid_attrs)
      assert annotations == Annotation.get_annotations!(annotations.id)
    end

    test "delete_annotations/1 deletes the annotations" do
      annotations = annotations_fixture()
      assert {:ok, %Annotations{}} = Annotation.delete_annotations(annotations)
      assert_raise Ecto.NoResultsError, fn -> Annotation.get_annotations!(annotations.id) end
    end

    test "change_annotations/1 returns a annotations changeset" do
      annotations = annotations_fixture()
      assert %Ecto.Changeset{} = Annotation.change_annotations(annotations)
    end
  end
end
