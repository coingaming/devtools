defmodule Mix.Tasks.Devtools.Major do
  use Mix.Task

  require Logger

  alias Mix.Devtools.Versions

  @shortdoc "Version patch + tag creation"
  def run(_args) do
    %Versions{ incrementer: &major/1 }
    |> Versions.increment()
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
