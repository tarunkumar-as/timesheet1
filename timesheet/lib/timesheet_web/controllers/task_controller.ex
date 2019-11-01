defmodule TimesheetWeb.TaskController do
  use TimesheetWeb, :controller

  alias Timesheet.Workers
  alias Timesheet.Workers.Worker
  alias Timesheet.Tasks
  alias Timesheet.Tasks.Task
  alias Timesheet.Jobs
  alias Timesheet.Jobs.Job

  def index(conn, _params) do
    tasks = Tasks.list_tasks()
    render(conn, "index.html", tasks: tasks)
  end

  def new(conn, _params) do
    changeset = Tasks.change_task(%Task{})
    jobs = Jobs.list_jobs()
    render(conn, "new.html", changeset: changeset, jobs: jobs)
  end

  def create(conn, %{"task" => task_params}) do
    IO.inspect(task_params)
    case Tasks.create_task(task_params) do
      {:ok, task} ->
        worker = Workers.list_worker()
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: Routes.worker_path(conn, :index, worker))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    render(conn, "show.html", task: task)
  end

  def edit(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    changeset = Tasks.change_task(task)
    render(conn, "edit.html", task: task, changeset: changeset)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Tasks.get_task!(id)

    case Tasks.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task: task, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    {:ok, _task} = Tasks.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.task_path(conn, :index))
  end
end
