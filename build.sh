#!/bin/bash
mix ecto.migrate
mix run priv/repo/seeds/csv_seeds.exs
mix phx.server
