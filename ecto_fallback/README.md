# Ecto Fallback

This example shows how to create a database fallback (in case the key doesn't
exist in cache) extremely easy, using a simple cache post hook.

For the database, this example uses [Ecto](https://github.com/elixir-ecto/ecto)
with its Postgres driver.

The trick is on the post hook logic which you can find [HERE](lib/ecto_fallback/cache.ex#L7-L21).
Besides, the post hook strategy must be set to `pipe`, check the [config](config/config.exs#L16).

## Getting started

First, let's create the database:

```
mix ecto.create
```

Then, run migrations:

```
mix ecto.migrate
```

Now we have the database setup and ready to be used.

Open an interactive Elixir console:

```
iex -S mix
```

Let's play a bit:

```elixir
# first let's check there is nothing in cache and repo either
iex(1)> EctoFallback.Cache.get({EctoFallback.Person, 1})

11:54:47.605 [debug] Try to retrieve key {EctoFallback.Person, 1} from database

11:54:47.628 [debug] QUERY OK source="people" db=1.5ms
SELECT p0."id", p0."first_name", p0."last_name", p0."age" FROM "people" AS p0 WHERE (p0."id" = $1) [1]
nil

# create a person
iex(2)> person = %EctoFallback.Person{first_name: "Carlos", last_name: "Bolanos", age: 33}
%EctoFallback.Person{__meta__: #Ecto.Schema.Metadata<:built, "people">, age: 33,
 first_name: "Carlos", id: nil, last_name: "Bolanos"}

# insert it into the database
iex(3)> person = EctoFallback.Repo.insert!(person)

11:48:30.677 [debug] QUERY OK db=4.1ms
INSERT INTO "people" ("age","first_name","last_name") VALUES ($1,$2,$3) RETURNING "id" [33, "Carlos", "Bolanos"]
%EctoFallback.Person{__meta__: #Ecto.Schema.Metadata<:loaded, "people">,
 age: 33, first_name: "Carlos", id: 3, last_name: "Bolanos"}

# now let's try to retrieve it from the cache
iex(4)> EctoFallback.Cache.get({EctoFallback.Person, 1})

11:50:44.647 [debug] Try to retrieve key {EctoFallback.Person, 1} from database

11:50:44.667 [debug] QUERY OK source="people" db=1.5ms decode=1.9ms
SELECT p0."id", p0."first_name", p0."last_name", p0."age" FROM "people" AS p0 WHERE (p0."id" = $1) [1]
%EctoFallback.Person{__meta__: #Ecto.Schema.Metadata<:loaded, "people">,
 age: 33, first_name: "Carlos", id: 1, last_name: "Bolanos"}
```

As you may have noticed, if requested key doesn't exist in cache, then the
database is checked, and if any data associated to that key is found, then
it is cached and returned, otherwise nil is returned. The post hook is who
do this work for us, check [EctoFallback.Cache](lib/ecto_fallback/cache.ex#L7-L21).
