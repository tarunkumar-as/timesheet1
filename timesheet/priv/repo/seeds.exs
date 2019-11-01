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

pass = Argon2.hash_pwd_salt("password")
Repo.insert!(%Manager{name: "Alice", email: "alice@example.com", password_hash: pass})
Repo.insert!(%Manager{name: "Bob", email: "bob@example.com", password_hash: pass})

Repo.insert!(%Worker{name: "Charlie", email: "charlie@example.com", password_hash: pass, manager_id: 1})
Repo.insert!(%Worker{name: "Dan", email: "dan@example.com", password_hash: pass, manager_id: 2})
