{
  inputs = {
    godev.url = github:defn/m/pkg-godev-0.0.70?dir=pkg/godev;
  };

  outputs = inputs:
    inputs.godev.inputs.goreleaser.inputs.pkg.main rec {
      src = ./.;
      defaultPackage = ctx: ctx.wrap.nullBuilder {
        propagatedBuildInputs = with ctx.pkgs; [
          inputs.godev.defaultPackage.${ctx.system}
          bashInteractive
        ];
      };

      packages = ctx: rec {
        devShell = ctx: ctx.wrap.devShell {
          devInputs = [
            (defaultPackage ctx)
          ];
        };
      };
    };
}
