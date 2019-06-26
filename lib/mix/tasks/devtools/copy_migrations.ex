defmodule Mix.Tasks.Devtools.CopyMigrations do
  use Mix.Task

  require Logger

  alias Mix.Tasks.Devtools.Common

  @shortdoc "Copy migrations"
  def run(_args) do
    migrations_copy_to = Path.join(Common.root_path(), Common.migrations_path())

    Logger.info("Common root path: #{Common.root_path()}")
    Logger.info("CurrentProject: #{current_project}")
    Logger.info("Copy to: #{migrations_copy_to}")

    migrations_copy_from =
      case current_project do
        "loyalty-api" ->
          Path.join(Common.root_path(), "../loyalty-worker")

        "loyalty-worker" ->
          Path.join(Common.root_path(), "../loyalty-api")

        path ->
          raise "Can not get project: #{path}"
      end
      |> Path.join(Common.migrations_path())

    Logger.info("Copying migrations from #{migrations_copy_from} to #{migrations_copy_to}")
    File.cp_r!(migrations_copy_from, migrations_copy_to)
  end

  defp current_project do
    Common.root_path() |> String.split("/") |> List.last()
  end
end
