# Devtools

Dev tools

```
mix devtools.docker_build your-app-name
mix devtools.docker_push
mix devtools.remote_console my-mega-app orgname/image
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `devtools` to your list of dependencies in `mix.exs`:

```
def deps do
  [
    {:devtools, "~> 0.1.0"}
  ]
end
```

# Release

```
./scripts/release.sh 
mix hex.publish
```

