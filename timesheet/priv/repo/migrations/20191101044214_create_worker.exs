defmodule Timesheet.Repo.Migrations.CreateWorker do
  use Ecto.Migration

  def change do
    create table(:worker) do
      add :email, :string, null: false
      add :name, :string, null: false
      add :password_hash, :string, null: false
      add :manager_id, references(:managers, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:worker, [:manager_id])
  end
end
