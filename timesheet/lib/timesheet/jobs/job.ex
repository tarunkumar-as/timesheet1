defmodule Timesheet.Jobs.Job do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jobs" do
    field :budget_hours, :string
    field :description, :string
    field :job_id, :string
    field :job_name, :string
    field :manager_id, :id

    timestamps()
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:job_id, :budget_hours, :job_name, :description])
    |> validate_required([:job_id, :budget_hours, :job_name, :description])
  end
end
