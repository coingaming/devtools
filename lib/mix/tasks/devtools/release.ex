defmodule Mix.Tasks.Devtools.Release do
  use Mix.Task
  
  @shortdoc "Prepare for release"
  def run(args) do
    path = Path.join(File.cwd!(), "/deps/devtools/scripts/release")
    {_, 0} = System.cmd(path, args) |> IO.inspect
  end
end