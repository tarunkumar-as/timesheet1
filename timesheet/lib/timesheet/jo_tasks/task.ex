defmodule Timesheet.JoTasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :hours, :integer
    field :note, :string
    field :worker_id, :id
    field :job_code, :id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:hours, :note])
    |> validate_required([:hours, :note])
  end
end
