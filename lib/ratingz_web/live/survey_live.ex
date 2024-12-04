defmodule RatingzWeb.SurveyLive do
  alias RatingzWeb.DemographicLive
  alias Ratingz.Survey
  use RatingzWeb, :live_view
  alias __MODULE__.Component

  def mount(_params, _session, socket) do
    {:ok, socket |> assign_demographic}
  end

  defp assign_demographic(%{assigns: %{current_user: current_user}} = socket) do
    socket |> assign(:demographic, Survey.get_demographics_for_user(current_user))
  end

  def handle_info({:created_demographic, demographic}, socket) do
    {:noreply,
     socket |> put_flash(:info, "Demographic info saved") |> assign(:demographic, demographic)}
  end
end
