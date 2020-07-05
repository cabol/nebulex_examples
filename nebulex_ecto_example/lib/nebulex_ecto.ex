defmodule NebulexEctoExample do
  @moduledoc false

  use Nebulex.Caching

  alias NebulexEctoExample.{Cache, Person, Repo}

  @decorate cacheable(cache: Cache, key: {Person, id})
  def get_person(id) do
    Repo.get(Person, id)
  end

  @decorate cache_put(cache: Cache, key: {Person, person.id})
  def update_person!(%Person{} = person, attrs) do
    person
    |> Person.changeset(attrs)
    |> Repo.update!()
  end

  @decorate cache_evict(cache: Cache, key: {Person, person.id})
  def delete_person(%Person{} = person) do
    Repo.delete(person)
  end
end
