defmodule RatingzWeb.DemographicLive.Show do
  use RatingzWeb, :html
  alias Ratingz.Survey.Demographic
  use Phoenix.Component

  attr :demographic, Demographic, required: true

  def details(assigns) do
    ~H"""
    <div>
      <h2 class="flex items-center gap-3 text-2xl font-bold text-fuchsia-600">
        Demographic Details <.icon name="hero-check-badge" />
      </h2>
      <ul>
        <li>Gender: <%= @demographic.gender %></li>
        <li>YoB: <%= @demographic.year_of_birth %></li>
      </ul>
    </div>
    """
  end
end
