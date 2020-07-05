# Nebulex and Ecto Integration Example

This example illustrates how to integrate [Nebulex](https://github.com/cabol/nebulex)
and [Ecto](https://github.com/elixir-ecto/ecto) extremely easy, using
[declarative annotation-based caching via decorators](http://hexdocs.pm/nebulex/Nebulex.Caching.html).

See also [Cache Usage Patterns](http://hexdocs.pm/nebulex/cache-usage-patterns.html)

## Getting started

First of all, let's setup the database:

```
$ mix ecto.create && mix ecto.migrate
```

Now we have the database setup and ready to be used.

Open an interactive Elixir console:

```
iex -S mix
```

Let's play a bit:

```elixir
iex(1)> alias NebulexEctoExample.Person
NebulexEctoExample.Person

iex(2)> person = %Person{first_name: "Carlos", last_name: "Bolanos", age: 33}
%NebulexEctoExample.Person{
  __meta__: #Ecto.Schema.Metadata<:built, "people">,
  age: 33,
  first_name: "Carlos",
  id: nil,
  last_name: "Bolanos"
}

iex(3)> NebulexEctoExample.get_person(1)

15:45:25.700 [debug] QUERY OK source="people" db=2.3ms
SELECT p0."id", p0."first_name", p0."last_name", p0."age" FROM "people" AS p0 WHERE (p0."id" = $1) [1]
nil

iex(4)> NebulexEctoExample.Cache.get({Person, 1})
nil

iex(5)> {:ok, person} = NebulexEctoExample.Repo.insert(person)

17:37:42.531 [debug] QUERY OK db=1.4ms queue=1.0ms
INSERT INTO "people" ("age","first_name","last_name") VALUES ($1,$2,$3) RETURNING "id" [33, "Carlos", "Bolanos"]
{:ok,
 %NebulexEctoExample.Person{
   __meta__: #Ecto.Schema.Metadata<:loaded, "people">,
   age: 33,
   first_name: "Carlos",
   id: 1,
   last_name: "Bolanos"
 }}

iex(6)> NebulexEctoExample.get_person(1)

17:38:14.215 [debug] QUERY OK source="people" db=0.6ms
SELECT p0."id", p0."first_name", p0."last_name", p0."age" FROM "people" AS p0 WHERE (p0."id" = $1) [1]
%NebulexEctoExample.Person{
  __meta__: #Ecto.Schema.Metadata<:loaded, "people">,
  age: 33,
  first_name: "Carlos",
  id: 1,
  last_name: "Bolanos"
}

iex(7)> NebulexEctoExample.Cache.get({Person, 1})
%NebulexEctoExample.Person{
  __meta__: #Ecto.Schema.Metadata<:loaded, "people">,
  age: 33,
  first_name: "Carlos",
  id: 1,
  last_name: "Bolanos"
}
```

So far seems to be working as expected, let's force some evictions:

```elixir
iex(8)> person = NebulexEctoExample.update_person!(person, %{last_name: "Andres"})

17:43:07.091 [debug] QUERY OK db=1.3ms queue=1.3ms
UPDATE "people" SET "last_name" = $1 WHERE "id" = $2 ["Andres", 1]
%NebulexEctoExample.Person{
  __meta__: #Ecto.Schema.Metadata<:loaded, "people">,
  age: 33,
  first_name: "Carlos",
  id: 1,
  last_name: "Andres"
}

iex(11)> NebulexEctoExample.Cache.get({Person, 1})
%NebulexEctoExample.Person{
  __meta__: #Ecto.Schema.Metadata<:loaded, "people">,
  age: 33,
  first_name: "Carlos",
  id: 1,
  last_name: "Andres"
}

iex(12)> NebulexEctoExample.delete_person(person)

17:44:39.473 [debug] QUERY OK db=1.5ms queue=1.7ms
DELETE FROM "people" WHERE "id" = $1 [1]
{:ok,
 %NebulexEctoExample.Person{
   __meta__: #Ecto.Schema.Metadata<:deleted, "people">,
   age: 33,
   first_name: "Carlos",
   id: 1,
   last_name: "Andres"
 }}

iex(13)> NebulexEctoExample.Cache.get({Person, 1})
nil
```

Now you can continue testing more functions!
