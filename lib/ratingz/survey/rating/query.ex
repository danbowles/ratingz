defmodule Ratingz.Survey.Rating.Query do
  alias Ratingz.Repo
  import Ecto.Query
  alias Ratingz.Survey.Rating

  def base, do: Rating

  def preload_user(user) do
    base() |> for_user(user)
  end

  defp for_user(query, user) do
    IO.inspect(query |> where([r], r.user_id == ^user.id) |> Repo.all())

    query
    |> where([r], r.user_id == ^user.id)
  end
end
