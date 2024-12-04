defmodule RatingzWeb.SurveyLive do
  use RatingzWeb, :live_view
  alias RatingzWeb.DemographicLive
  alias RatingzWeb.RatingLive
  alias Ratingz.Survey
  alias Ratingz.Catalog
  alias __MODULE__.Component

  def mount(_params, _session, socket) do
    {:ok, socket |> assign_demographic() |> assign_products()}
  end

  defp assign_demographic(%{assigns: %{current_user: current_user}} = socket) do
    socket |> assign(:demographic, Survey.get_demographics_for_user(current_user))
  end

  defp assign_products(%{assigns: %{current_user: current_user}} = socket) do
    socket |> assign(:products, Catalog.list_products_with_user_rating(current_user))
    # socket
  end

  def handle_info({:created_demographic, demographic}, socket) do
    {:noreply,
     socket |> put_flash(:info, "Demographic info saved") |> assign(:demographic, demographic)}
  end
end
