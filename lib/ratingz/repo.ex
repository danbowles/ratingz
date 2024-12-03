defmodule Ratingz.Repo do
  use Ecto.Repo,
    otp_app: :ratingz,
    adapter: Ecto.Adapters.Postgres
end
