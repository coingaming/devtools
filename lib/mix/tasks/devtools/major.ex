defmodule Mix.Tasks.Devtools.Major do
  use Mix.Task

  require Logger

  alias Mix.Tasks.Devtools.Versions

  @shortdoc "Version patch + tag creation"
  def run(_args) do
    Versions.increment(&File.read/1, &File.write/2, &major/1, "mix.exs")
  end

  # private 

  defp major([major, _minor, _patch] = version) do
    major
    |> increment_old_major
    |> case do
      {:ok, new_major} ->
        {:ok, construct_new_release(version, new_major)}
    end
  end

  defp construct_new_release(_values, new_major) do
    "#{new_major}.0.0"
  end

  defp increment_old_major(old_major) when is_binary(old_major) do
    {int_val, _} = Integer.parse(old_major)
    {:ok, "#{int_val + 1}"}
  end
end
