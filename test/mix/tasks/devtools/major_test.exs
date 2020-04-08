defmodule Mix.Tasks.Devtools.MajorTest do
  use ExUnit.Case

  alias Mix.Tasks.Devtools.Major

  setup do
    {:ok, content} = File.read("mix.exs")

    on_exit(fn ->
      File.write("mix.exs", content)
    end)

    %{content: content}
  end

  test "changes file content", %{content: content} do
    Major.run({})
    {:ok, new_mix} = File.read("mix.exs")

    assert content != new_mix
  end

  test "changes file content to correct one", %{content: content} do
    Major.run({})
    {:ok, new_mix} = File.read("mix.exs")
    assert length(String.myers_difference(content, new_mix)) == 10
  end
end
