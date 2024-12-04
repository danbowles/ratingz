defmodule RatingzWeb.RatingLive.Index do
  alias RatingzWeb.RatingLive
  use RatingzWeb, :html
  use Phoenix.Component

  attr :product, Ratingz.Catalog.Product, required: true
  attr :current_user, :any, required: true

  def product_rating(assigns) do
    ~H"""
    <div>
      <h3><%= @product.name %></h3>
      <%= if rating = List.first(@product.ratings) do %>
        <RatingLive.Show.stars rating={rating} />
      <% else %>
        <p><strong><%= @product.name %></strong> rating form coming soon</p>
      <% end %>
    </div>
    """
  end

  attr :products, :list, required: true

  def heading(assigns) do
    ~H"""
    <h2 class="text-2xl font-bold text-fuchsia-600">
      Ratings
      <%= if ratings_complete?(@products) do %>
        <.icon name="hero-check-badge" />
      <% end %>
    </h2>
    """
  end

  attr :products, :list, required: true
  attr :current_user, :any, required: true

  def product_list(assigns) do
    ~H"""
    <.heading products={@products} />
    <div class="grid grid-cols-2 gap-4 divide-y">
      <.product_rating :for={product <- @products} current_user={@current_user} product={product} />
    </div>
    """
  end

  defp ratings_complete?(products) do
    Enum.all?(products, fn product -> not Enum.empty?(product.ratings) end)
  end
end
