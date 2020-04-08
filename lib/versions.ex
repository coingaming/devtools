defmodule Mix.Devtools.Versions do
  require Logger

  alias __MODULE__, as: Versions

  @version_regex ~r/version:\s\"(.*)\"/
  @file_name "mix.exs"

  defstruct [:incrementer]

  def increment(%Versions{
        incrementer: incrementer
      }) do
    with {:ok, content} <- File.read(@file_name),
         {:ok, [major, minor, patch] = current_version} <- get_current_version(content),
         {:ok, new_version} <- incrementer.(current_version),
         {:ok, new_content} <- content_replace(content, "#{major}.#{minor}.#{patch}", new_version) do
      File.write(@file_name, new_content)
    else
      error ->
        Logger.error("There was an error: #{inspect(error)}")
    end
  end

  # private 

  defp get_current_version(content) when is_binary(content) do
    @version_regex
    |> Regex.run(content)
    |> ensure_version
  end

  defp content_replace(content, current_version, new_version) do
    {:ok,
     String.replace(content, "version: \"#{current_version}\"", "version: \"#{new_version}\"")}
  end

  defp check_values(values) when length(values) == 2 do
    [_, version] = values
    {:ok, version}
  end

  defp check_values(_), do: {:error, "could not parse version"}

  defp ensure_version(nil),
    do:
      {:error, "version not found, it should be explicitly set in mix.exs as version: \"n.n.n\""}

  defp ensure_version(values) do
    values
    |> check_values()
    |> case do
      {:ok, version} ->
        {:ok, String.split(version, ".")}

      {:error, _} ->
        {:error, []}
    end
  end
end
