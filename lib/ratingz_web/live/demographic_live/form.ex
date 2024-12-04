defmodule RatingzWeb.DemographicLive.Form do
  use RatingzWeb, :live_component
  alias Ratingz.Survey
  alias Ratingz.Survey.Demographic

  def update(assigns, socket) do
    {:ok, socket |> assign(assigns) |> assign_demographic() |> assign_changeset()}
  end

  defp assign_demographic(%{assigns: %{current_user: current_user}} = socket) do
    assign(socket, :demographic, %Demographic{user_id: current_user.id})
  end

  defp assign_changeset(%{assigns: %{demographic: demographic}} = socket) do
    assign(socket, :form, to_form(Survey.change_demographic(demographic)))
  end

  def handle_event("save", %{"demographic" => demographic_params}, socket) do
    params = Map.put(demographic_params, "user_id", socket.assigns.current_user.id)
    {:noreply, save_demographic(socket, params)}
  end

  defp save_demographic(socket, demographic_params) do
    case Survey.create_demographic(demographic_params) do
      {:ok, demographic} ->
        notify_parent({:created_demographic, demographic})
        socket

      {:error, %Ecto.Changeset{} = changeset} ->
        socket |> assign(form: to_form(changeset))
    end
  end

  defp notify_parent(msg), do: send(self(), msg)
end
