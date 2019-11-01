defmodule Timesheet.JoTasksTest do
  use Timesheet.DataCase

  alias Timesheet.JoTasks

  describe "tasks" do
    alias Timesheet.JoTasks.Task

    @valid_attrs %{hours: 42, note: "some note"}
    @update_attrs %{hours: 43, note: "some updated note"}
    @invalid_attrs %{hours: nil, note: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> JoTasks.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert JoTasks.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert JoTasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = JoTasks.create_task(@valid_attrs)
      assert task.hours == 42
      assert task.note == "some note"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = JoTasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = JoTasks.update_task(task, @update_attrs)
      assert task.hours == 43
      assert task.note == "some updated note"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = JoTasks.update_task(task, @invalid_attrs)
      assert task == JoTasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = JoTasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> JoTasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = JoTasks.change_task(task)
    end
  end
end
