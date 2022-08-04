defmodule Csv.Repo do
  use Ecto.Repo,
    otp_app: :csv_module,
    adapter: Ecto.Adapters.Postgres
end
