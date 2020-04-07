defmodule Mix.Tasks.Devtools.Minor do
  use Mix.Task

  require Logger

  alias Mix.Tasks.Devtools.Versions

  @shortdoc "Version patch + tag creation"
  def run(_args) do
    Versions.increment(&File.read/1, &File.write/2, &minor/1, "mix.exs")
  end

  # private 

  defp minor([_major, minor, _patch] = version) do
    minor
    |> increment_old_minor
    |> case do
      {:ok, new_pre_release} ->
        {:ok, construct_new_pre_release(version, new_pre_release)}
    end
  end

  defp construct_new_pre_release(values, new_minor) do
    [major, _minor, _] = values
    "#{major}.#{new_minor}.0"
  end

  defp increment_old_minor(old_minor) when is_binary(old_minor) do
    {int_val, _} = Integer.parse(old_minor)
    {:ok, "#{int_val + 1}"}
  end
end
