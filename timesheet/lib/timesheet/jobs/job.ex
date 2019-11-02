defmodule Timesheet.Jobs.Job do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jobs" do
    field :budget_hours, :integer
    field :description, :string
    field :job_code, :string
    field :job_name, :string
    field :manager_id, :id

    timestamps()
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:job_code, :budget_hours, :job_name, :description, :manager_id])
    |> validate_required([:job_code, :budget_hours, :job_name, :description, :manager_id])
  end
end
