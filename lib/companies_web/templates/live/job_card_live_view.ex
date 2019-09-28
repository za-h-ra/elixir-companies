defmodule CompaniesWeb.JobCardLiveView do
  use Phoenix.LiveView

  def mount(session, socket) do
    socket =
      socket
      |> assign(job: session.job)
      |> try_to_assign_user(session)

    {:ok, socket}
  end

  def render(assigns) do
    CompaniesWeb.LiveView.render("job.html", assigns)
  end

  defp try_to_assign_user(socket, %{current_user: nil}), do: socket
  defp try_to_assign_user(socket, %{current_user: current_user}), do: assign(socket, current_user: current_user)
end
