defmodule NebulexEctoExample.CacheableRepo do
  use NebulexEcto.Repo,
    cache: NebulexEctoExample.Cache,
    repo: NebulexEctoExample.Repo
end
