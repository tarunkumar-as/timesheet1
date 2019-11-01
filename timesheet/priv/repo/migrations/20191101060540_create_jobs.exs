defmodule Timesheet.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add :job_code, :string
      add :budget_hours, :integer
      add :job_name, :string
      add :description, :string
      add :manager_id, references(:managers, on_delete: :nothing)

      timestamps()
    end

    create index(:jobs, [:manager_id])
  end
end
