defmodule Mix.Devtools.Common do
  def scripts_path do
    Path.join(File.cwd!(), "deps/devtools/scripts/")
  end

  def root_path do
    File.cwd!()
  end

  def migrations_path do
    "priv/repo/migrations"
  end
end
