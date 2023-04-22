{
  inputs = {
    godev.url = github:defn/m/pkg-godev-0.0.76?dir=pkg/godev;
  };

  outputs = inputs:
    inputs.godev.inputs.goreleaser.inputs.pkg.main rec {
      src = ./.;
      defaultPackage = ctx: ctx.wrap.nullBuilder {
        propagatedBuildInputs = with ctx.pkgs; [
          bashInteractive
          rsync
          inputs.godev.defaultPackage.${ctx.system}
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
