defmodule Timesheet.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :hours, :integer
      add :note, :string
      add :approval, :boolean, default: false, null: false
      add :job_code, references(:jobs, on_delete: :nothing)
      add :worker_id, references(:worker, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:job_code])
    create index(:tasks, [:worker_id])
  end
end
