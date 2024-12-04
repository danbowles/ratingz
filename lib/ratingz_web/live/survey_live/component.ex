defmodule RatingzWeb.SurveyLive.Component do
  use Phoenix.Component

  attr :content, :string, required: true
  slot :inner_block, required: true

  def hero(assigns) do
    ~H"""
    <header>
      <h1 class="text-2xl font-bold text-fuchsia-600"><%= @content %></h1>
      <div class="mt-4">
        <%= render_slot(@inner_block) %>
      </div>
    </header>
    """
  end
end
