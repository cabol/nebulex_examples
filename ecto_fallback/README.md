# Ecto Fallback

This example shows how to create a database fallback (in case the key doesn't
exist in cache) extremely easy, using a simple cache post hook.

For the database, this example uses [Ecto](https://github.com/elixir-ecto/ecto)
with its Postgres driver.

The trick is done by means of a **post-hook**, check out the logic
[HERE](lib/ecto_fallback/cache.ex#L9-L24).

## Getting started

First of all, let's setup the database:

```
$ mix ecto.create
$ mix ecto.migrate
```

Open an Elixir console:

```
iex -S mix
```

Let's play a bit:

```elixir
# first let's check there is nothing in cache and repo either
iex(1)> EctoFallback.Cache.get({EctoFallback.Person, 1})

13:12:09.861 [debug] Try to retrieve key {EctoFallback.Person, 1} from database

13:12:09.882 [debug] QUERY OK source="people" db=2.1ms
SELECT p0."id", p0."first_name", p0."last_name", p0."age" FROM "people" AS p0 WHERE (p0."id" = $1) [1]
nil

# create a person
iex(2)> person = %EctoFallback.Person{first_name: "Carlos", last_name: "Bolanos", age: 33}
%EctoFallback.Person{
  __meta__: #Ecto.Schema.Metadata<:built, "people">,
  age: 33,
  first_name: "Carlos",
  id: nil,
  last_name: "Bolanos"
}

# insert it into the database
iex(3)> person = EctoFallback.Repo.insert!(person)

12:38:47.169 [debug] QUERY OK db=4.4ms
INSERT INTO "people" ("age","first_name","last_name") VALUES ($1,$2,$3) RETURNING "id" [33, "Carlos", "Bolanos"]
%EctoFallback.Person{
  __meta__: #Ecto.Schema.Metadata<:loaded, "people">,
  age: 33,
  first_name: "Carlos",
  id: 1,
  last_name: "Bolanos"
}

# now let's try to retrieve it from the cache
iex(4)> EctoFallback.Cache.get({EctoFallback.Person, 1})

13:12:51.510 [debug] Try to retrieve key {EctoFallback.Person, 1} from database

13:12:51.516 [debug] QUERY OK source="people" db=2.4ms decode=2.7ms
SELECT p0."id", p0."first_name", p0."last_name", p0."age" FROM "people" AS p0 WHERE (p0."id" = $1) [1]
%EctoFallback.Person{
  __meta__: #Ecto.Schema.Metadata<:loaded, "people">,
  age: 33,
  first_name: "Carlos",
  id: 1,
  last_name: "Bolanos"
}

# at this point, the data should be cached already, let's check
iex(5)> EctoFallback.Cache.get({EctoFallback.Person, 1})
%EctoFallback.Person{
  __meta__: #Ecto.Schema.Metadata<:loaded, "people">,
  age: 33,
  first_name: "Carlos",
  id: 1,
  last_name: "Bolanos"
}
```

As you may have noticed, if the requested key is not in cache, the database is
hit to try to retrieve it from there, at that moment the key is cached so the
next time it is retrieved directly from cache (without hit the database).
The "post-hook" is the one that does the work for us, check out
[EctoFallback.Cache](lib/ecto_fallback/cache.ex#L9-L24).
