defmodule NebulexEctoExample do
  @moduledoc false

  import Nebulex.Caching

  alias NebulexEctoExample.{Cache, Person, Repo}

  defcacheable get_person(id), cache: Cache, key: {Person, id} do
    Repo.get(Person, id)
  end

  defupdatable update_person!(%Person{} = person, attrs), cache: Cache, key: {Person, person.id} do
    person
    |> Person.changeset(attrs)
    |> Repo.update!()
  end

  defevict delete_person(%Person{} = person), cache: Cache, key: {Person, person.id} do
    Repo.delete(person)
  end
end
