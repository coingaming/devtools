defmodule Mix.Tasks.Devtools.Versions do
  require Logger

  @version_regex ~r/version:\s\"(.*)\"/

  def increment(content_getter, content_setter, incrementer, file_name) do
    with {:ok, content} <- content_getter.(file_name),
         {:ok, current_version} <- get_current_version(content),
         {:ok, new_version} <- incrementer.(current_version),
         {:ok, new_content} <- content_replace(content, current_version, new_version) do
      content_setter.(file_name, new_content)
    end
  end
  
  # private 

  defp get_current_version(content) when is_binary(content) do
    @version_regex
    |> Regex.run(content)
    |> case do
      nil ->
        {:error,
         "version not found, it should be explicitly set in mix.exs as version: \"n.n.n\""}

      values ->
        if length(values) >= 2 do
          [_, version] = values
          {:ok, version}
        else
          {:error,
           "mailformed version,  it should be explicitly set in mix.exs as version: \"n.n.n\""}
        end
    end
  end

  defp content_replace(content, current_version, new_version) do
    {:ok,
     String.replace(content, "version: \"#{current_version}\"", "version: \"#{new_version}\"")}
  end

end
