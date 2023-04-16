{
  inputs = {
    goreleaser.url = github:defn/m/pkg-goreleaser-1.17.1-3?dir=pkg/goreleaser;
    buf.url = github:defn/m/pkg-buf-1.17.0-5?dir=pkg/buf;
    operatorsdk.url = github:defn/m/pkg-operatorsdk-1.28.0-5?dir=pkg/operatorsdk;
    cosign.url = github:defn/m/pkg-cosign-2.0.1-5?dir=pkg/cosign;
    latest.url = github:NixOS/nixpkgs?rev=e3b18e82da9ab82b572d70c162d4e13a058aeb7d;
  };

  outputs = inputs: inputs.goreleaser.inputs.pkg.main rec {
    src = ./.;

    defaultPackage = ctx: ctx.wrap.nullBuilder {
      propagatedBuildInputs =
        with (import inputs.latest { system = ctx.system; }); [
          gcc
          gotools
          go-tools
          golangci-lint
          go-outline
          gopkgs
          delve
          gopls
          go_1_20
          inputs.buf.defaultPackage.${ctx.system}
          inputs.operatorsdk.defaultPackage.${ctx.system}
          inputs.goreleaser.defaultPackage.${ctx.system}
          inputs.cosign.defaultPackage.${ctx.system}
          bashInteractive
        ];
    };
  };
}
