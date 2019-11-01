defmodule TimesheetWeb.SessionmanagerController do
    use TimesheetWeb, :controller

    def new(conn, _params) do
        render(conn, "new.html")
    end


    def create(conn, %{"email" => email, "password" => password}) do
      IO.inspect("password")
      IO.inspect(password)
      IO.inspect("passwordend")
      user = Timesheet.Managers.authenticate(email, password)
      #user = Timesheet.Managers.get_manager_by_email(email)
        if user do
          conn
          |> put_session(:user_id, user.id)
          |> put_flash(:info, "Welcome back #{user.email}")
          #|> redirect(to: Routes.page_path(conn, :index))
          |> redirect(to: Routes.manager_path(conn, :index))
        else
          conn
          |> put_flash(:error, "Login failed.")
          |> redirect(to: Routes.page_path(conn, :index))
        end
      end
    
      def delete(conn, _params) do
        conn
        |> delete_session(:user_id)
        |> put_flash(:info, "Logged out.")
        |> redirect(to: Routes.page_path(conn, :index))
    end
end