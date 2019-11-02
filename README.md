# Timesheet

This Repository contains the Timesheet application for a company having managers and workers. 

-) Each worker is assingned to a manager and any timesheet uploaded the worker will be approved by the manager. 

-) The manager has the permission to approve or decline a timesheet record.

-) As a worker he/she will be able to add 8 records with each record having a maximum of 8 hours.

-) If he/she tries to add more than 8 hours it will throw an error.

-) The database consisits of 4 tables - Managers, Workers, Jobs and Tasks.

-) The Manager table and the Worker ttable consists of email password and the user name. The password is hashed using Argon and hence even if the database is compromised the password will be leaked to the hacker.

-) The Jobs table consists of job code, number of hours of the job, the job name, its description and the manager who will be approving the timesheet records associated to the particular job.

-) The Tasks table is the timesheet table and it consists of the number of hours clocked by the worker, the job code with which this task is associated with, the status which tells if the timesheet is approved or not, the perso id who is filing the timesheet record and any additional notes that is required for the timesheet record.

-) The sample manager id and passowrds are mentioned in the seeds.exs files.




Attribution

https://getbootstrap.com/docs/4.0/content/tables/
https://hexdocs.pm/elixir/Enum.html
https://elixir-lang.org/getting-started/debugging.html
http://elixirschool.com/en
