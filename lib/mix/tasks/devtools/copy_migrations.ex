defmodule Mix.Tasks.Devtools.CopyMigrations do
  use Mix.Task

  alias Mix.Tasks.Devtools.Common

  @shortdoc "Copy migrations"
  def run(_args) do
    migrations_copy_from = Path.join(Common.root_path, Common.migrations_path)
    migrations_copy_to = case Common.root_path |> String.split("/") |> List.last do
      "loyalty-api" ->
        Path.join(Common.root_path, "../loyalty-worker")

      "loyalty-worker" ->
        Path.join(Common.root_path, "../loyalty-api")

      _ ->
        Path.join(Common.root_path, "../loyalty-api")
    end
    |> Path.join(Common.migrations_path)

    File.cp_r(migrations_copy_from, migrations_copy_to)
  end
end
