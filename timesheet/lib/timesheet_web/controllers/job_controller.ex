defmodule TimesheetWeb.JobController do
  use TimesheetWeb, :controller

  alias Timesheet.JoTabs
  alias Timesheet.JoTabs.Job

  def index(conn, _params) do
    jobs = JoTabs.list_jobs()
    render(conn, "index.html", jobs: jobs)
  end

  def new(conn, _params) do
    changeset = JoTabs.change_job(%Job{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"job" => job_params}) do
    case JoTabs.create_job(job_params) do
      {:ok, job} ->
        conn
        |> put_flash(:info, "Job created successfully.")
        |> redirect(to: Routes.job_path(conn, :show, job))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    job = JoTabs.get_job!(id)
    render(conn, "show.html", job: job)
  end

  def edit(conn, %{"id" => id}) do
    job = JoTabs.get_job!(id)
    changeset = JoTabs.change_job(job)
    render(conn, "edit.html", job: job, changeset: changeset)
  end

  def update(conn, %{"id" => id, "job" => job_params}) do
    job = JoTabs.get_job!(id)

    case JoTabs.update_job(job, job_params) do
      {:ok, job} ->
        conn
        |> put_flash(:info, "Job updated successfully.")
        |> redirect(to: Routes.job_path(conn, :show, job))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", job: job, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    job = JoTabs.get_job!(id)
    {:ok, _job} = JoTabs.delete_job(job)

    conn
    |> put_flash(:info, "Job deleted successfully.")
    |> redirect(to: Routes.job_path(conn, :index))
  end
end
