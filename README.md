## Pre-requisites

Install `nix` and finish `direnv` integration.

## Using the CLI

Run the CLI:

```
go run .
```

Run the TUI:

```
go run . tui
```

Run the GRPC server:

```
go run . server
```

Run the GRPC client:

```
go run . client
```

Run the cdktf generator:

```
go run . infra
```

Load and verify bash completion:

```
go install
source /etc/profile.d/bash_completion.sh
eval "$(template-go completion bash)"
complete -p template-go
template-go <TAB>
```

## Adding sub-commands

Use `cobra-cli` to add a command to the CLI.  For example, to add a `start` command:

```
cobra-cli add start
```
