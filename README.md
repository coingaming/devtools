# Devtools

Dev tools

```
mix devtools.docker_build your-app-name
mix devtools.docker_push
mix devtools.remote_console my-mega-app orgname/image
```
|Command|Description|
|---|---|
|mix devtools.major| Will bump major version and push to github. I.e. v1.1.1 -> v2.0.0 |
|mix devtools.minor| Will bump minor version and push to github. I.e. v1.1.1 -> v1.2.0 |
|mix devtools.patch| Will bump patch version and push to github. I.e. v1.1.1 -> v1.1.1 |
|mix devtools.pre| Will bump or create pre-release version and push to github. I.e. v1.1.1 -> v1.1.1-0 or v1.1.1-0 -> v1.1.1-1 |

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
./scripts/patch
mix hex.publish
```

