defmodule RumblWeb.AnnotationsControllerTest do
  use RumblWeb.ConnCase

  alias Rumbl.Annotation

  @create_attrs %{at: 42, body: "some body"}
  @update_attrs %{at: 43, body: "some updated body"}
  @invalid_attrs %{at: nil, body: nil}

  def fixture(:annotations) do
    {:ok, annotations} = Annotation.create_annotations(@create_attrs)
    annotations
  end

  describe "index" do
    test "lists all annotations", %{conn: conn} do
      conn = get(conn, Routes.annotations_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Annotations"
    end
  end

  describe "new annotations" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.annotations_path(conn, :new))
      assert html_response(conn, 200) =~ "New Annotations"
    end
  end

  describe "create annotations" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.annotations_path(conn, :create), annotations: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.annotations_path(conn, :show, id)

      conn = get(conn, Routes.annotations_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Annotations"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.annotations_path(conn, :create), annotations: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Annotations"
    end
  end

  describe "edit annotations" do
    setup [:create_annotations]

    test "renders form for editing chosen annotations", %{conn: conn, annotations: annotations} do
      conn = get(conn, Routes.annotations_path(conn, :edit, annotations))
      assert html_response(conn, 200) =~ "Edit Annotations"
    end
  end

  describe "update annotations" do
    setup [:create_annotations]

    test "redirects when data is valid", %{conn: conn, annotations: annotations} do
      conn = put(conn, Routes.annotations_path(conn, :update, annotations), annotations: @update_attrs)
      assert redirected_to(conn) == Routes.annotations_path(conn, :show, annotations)

      conn = get(conn, Routes.annotations_path(conn, :show, annotations))
      assert html_response(conn, 200) =~ "some updated body"
    end

    test "renders errors when data is invalid", %{conn: conn, annotations: annotations} do
      conn = put(conn, Routes.annotations_path(conn, :update, annotations), annotations: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Annotations"
    end
  end

  describe "delete annotations" do
    setup [:create_annotations]

    test "deletes chosen annotations", %{conn: conn, annotations: annotations} do
      conn = delete(conn, Routes.annotations_path(conn, :delete, annotations))
      assert redirected_to(conn) == Routes.annotations_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.annotations_path(conn, :show, annotations))
      end
    end
  end

  defp create_annotations(_) do
    annotations = fixture(:annotations)
    {:ok, annotations: annotations}
  end
end
