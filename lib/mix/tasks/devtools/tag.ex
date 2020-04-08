defmodule Mix.Tasks.Devtools.Tag do
  use Mix.Task

  require Logger

  @file_name "mix.exs"
  @version_regex ~r/version:\s\"(.*)\"/

  @shortdoc "Create git tag with new version and push it"
  def run(_args) do
    {:ok, content} = File.read(@file_name)

    [_, tag] = @version_regex
    |> Regex.run(content)

    System.cmd("git", ["add", @file_name])
    System.cmd("git", ["commit", "-m", "Update version in mix.exs to #{tag}"])
    System.cmd("git", ["push", "origin", "master"])

    System.cmd("git", ["tag", "v#{tag}"])
    System.cmd("git", ["push", "--tags"])
  end
end
