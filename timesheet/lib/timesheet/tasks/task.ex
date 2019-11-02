defmodule Timesheet.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :approval, :boolean, default: false
    field :hours, :integer
    field :note, :string
    field :job_code, :id
    field :worker_id, :id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:hours, :note, :approval, :job_code, :worker_id])
    |> validate_required([:hours, :note, :approval, :job_code, :worker_id])
    |> validate_inclusion(:hours, 1..8)
  end
end
