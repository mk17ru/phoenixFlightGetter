#!/bin/bash
mix deps.get
mix ecto.migrate
mix run priv/repo/seeds/csv_seeds.exs
mix phx.server
