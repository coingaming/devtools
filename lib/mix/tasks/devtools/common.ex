defmodule Mix.Tasks.Devtools.Common do
    def path do
        Path.join(File.cwd!(), "deps/devtools/scripts/")
    end
end