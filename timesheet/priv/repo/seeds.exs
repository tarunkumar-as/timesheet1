# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Timesheet.Repo.insert!(%Timesheet.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Timesheet.Repo
alias Timesheet.Managers.Manager
alias Timesheet.Workers.Worker
alias Timesheet.Tasks.Task
alias Timesheet.Jobs.Job

pass = Argon2.hash_pwd_salt("password")
Repo.insert!(%Manager{name: "Alice", email: "alice@example.com", password_hash: pass})
Repo.insert!(%Manager{name: "Bob", email: "bob@example.com", password_hash: pass})

Repo.insert!(%Worker{name: "Charlie", email: "charlie@example.com", password_hash: pass, manager_id: 1})
Repo.insert!(%Worker{name: "Dan", email: "dan@example.com", password_hash: pass, manager_id: 2})

Repo.insert!(%Job{budget_hours: 12, description: "For a main job", job_code: "qwert123", job_name: "Main Job", manager_id: 1})
Repo.insert!(%Job{budget_hours: 20, description: "For a sub job", job_code: "asdf321123", job_name: "Sub Job", manager_id: 2})

Repo.insert!(%Task{approval: false, hours: 5, note: "Simple Task", job_code: 1, worker_id: 1})
Repo.insert!(%Task{approval: false, hours: 5, note: "Simple Task2", job_code: 2, worker_id: 2})
