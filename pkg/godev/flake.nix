{
  inputs = {
    goreleaser.url = github:defn/m/pkg-goreleaser-1.17.1-1?dir=pkg/goreleaser;
    buf.url = github:defn/m/pkg-buf-1.17.0-3?dir=pkg/buf;
    operatorsdk.url = github:defn/m/pkg-operatorsdk-1.28.0-3?dir=pkg/operatorsdk;
    cosign.url = github:defn/m/pkg-cosign-2.0.1-3?dir=pkg/cosign;
    latest.url = github:NixOS/nixpkgs?rev=64c27498901f104a11df646278c4e5c9f4d642db; # nixos-unstable https://lazamar.co.uk/nix-versions/
  };

  outputs = inputs: inputs.goreleaser.inputs.pkg.main rec {
    src = ./.;

    defaultPackage = ctx: ctx.wrap.nullBuilder {
      propagatedBuildInputs =
        with (import inputs.latest { system = ctx.system; }); [
          gcc
          go_1_20
          bashInteractive
          gotools
          go-tools
          golangci-lint
          go-outline
          gopkgs
          delve
          gopls
          inputs.buf.defaultPackage.${ctx.system}
          inputs.operatorsdk.defaultPackage.${ctx.system}
          inputs.goreleaser.defaultPackage.${ctx.system}
          inputs.cosign.defaultPackage.${ctx.system}
        ];
    };
  };
}
