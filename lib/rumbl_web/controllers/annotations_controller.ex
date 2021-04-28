defmodule RumblWeb.AnnotationsController do
  use RumblWeb, :controller

  alias Rumbl.Annotation
  alias Rumbl.Annotation.Annotations

  def index(conn, _params) do
    annotations = Annotation.list_annotations()
    render(conn, "index.html", annotations: annotations)
  end

  def new(conn, _params) do
    changeset = Annotation.change_annotations(%Annotations{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"annotations" => annotations_params}) do
    case Annotation.create_annotations(annotations_params) do
      {:ok, annotations} ->
        conn
        |> put_flash(:info, "Annotations created successfully.")
        |> redirect(to: Routes.annotations_path(conn, :show, annotations))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    annotations = Annotation.get_annotations!(id)
    render(conn, "show.html", annotations: annotations)
  end

  def edit(conn, %{"id" => id}) do
    annotations = Annotation.get_annotations!(id)
    changeset = Annotation.change_annotations(annotations)
    render(conn, "edit.html", annotations: annotations, changeset: changeset)
  end

  def update(conn, %{"id" => id, "annotations" => annotations_params}) do
    annotations = Annotation.get_annotations!(id)

    case Annotation.update_annotations(annotations, annotations_params) do
      {:ok, annotations} ->
        conn
        |> put_flash(:info, "Annotations updated successfully.")
        |> redirect(to: Routes.annotations_path(conn, :show, annotations))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", annotations: annotations, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    annotations = Annotation.get_annotations!(id)
    {:ok, _annotations} = Annotation.delete_annotations(annotations)

    conn
    |> put_flash(:info, "Annotations deleted successfully.")
    |> redirect(to: Routes.annotations_path(conn, :index))
  end
end
