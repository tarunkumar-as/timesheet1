defmodule Timesheet.JoTabsTest do
  use Timesheet.DataCase

  alias Timesheet.JoTabs

  describe "jobs" do
    alias Timesheet.JoTabs.Job

    @valid_attrs %{budget_hours: 42, description: "some description", job_code: "some job_code", job_name: "some job_name"}
    @update_attrs %{budget_hours: 43, description: "some updated description", job_code: "some updated job_code", job_name: "some updated job_name"}
    @invalid_attrs %{budget_hours: nil, description: nil, job_code: nil, job_name: nil}

    def job_fixture(attrs \\ %{}) do
      {:ok, job} =
        attrs
        |> Enum.into(@valid_attrs)
        |> JoTabs.create_job()

      job
    end

    test "list_jobs/0 returns all jobs" do
      job = job_fixture()
      assert JoTabs.list_jobs() == [job]
    end

    test "get_job!/1 returns the job with given id" do
      job = job_fixture()
      assert JoTabs.get_job!(job.id) == job
    end

    test "create_job/1 with valid data creates a job" do
      assert {:ok, %Job{} = job} = JoTabs.create_job(@valid_attrs)
      assert job.budget_hours == 42
      assert job.description == "some description"
      assert job.job_code == "some job_code"
      assert job.job_name == "some job_name"
    end

    test "create_job/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = JoTabs.create_job(@invalid_attrs)
    end

    test "update_job/2 with valid data updates the job" do
      job = job_fixture()
      assert {:ok, %Job{} = job} = JoTabs.update_job(job, @update_attrs)
      assert job.budget_hours == 43
      assert job.description == "some updated description"
      assert job.job_code == "some updated job_code"
      assert job.job_name == "some updated job_name"
    end

    test "update_job/2 with invalid data returns error changeset" do
      job = job_fixture()
      assert {:error, %Ecto.Changeset{}} = JoTabs.update_job(job, @invalid_attrs)
      assert job == JoTabs.get_job!(job.id)
    end

    test "delete_job/1 deletes the job" do
      job = job_fixture()
      assert {:ok, %Job{}} = JoTabs.delete_job(job)
      assert_raise Ecto.NoResultsError, fn -> JoTabs.get_job!(job.id) end
    end

    test "change_job/1 returns a job changeset" do
      job = job_fixture()
      assert %Ecto.Changeset{} = JoTabs.change_job(job)
    end
  end
end
