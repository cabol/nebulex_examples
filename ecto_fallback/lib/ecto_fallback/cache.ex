defmodule EctoFallback.Cache do
  use Nebulex.Cache, otp_app: :ecto_fallback

  alias EctoFallback.Repo
  require Logger

  def post_hooks do
    [&repo_hook/2]
  end

  def repo_hook(nil, {_, :get, [{schema, id} = key, _]}) do
    Logger.debug "Try to retrieve key #{inspect key} from database"

    schema
    |> Repo.get(id)
    |> case do
      nil -> nil
      res -> set(key, res)
    end
  end
  def repo_hook(result, _), do: result
end
