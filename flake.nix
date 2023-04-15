{
  inputs = {
    gomod2nix.url = github:defn/gomod2nix/1.5.0-9;
    godev.url = github:defn/m/pkg-godev-0.0.69?dir=pkg/godev;
    nodedev.url = github:defn/m/pkg-nodedev-0.0.43?dir=pkg/nodedev;
    latest.url = github:NixOS/nixpkgs?rev=64c27498901f104a11df646278c4e5c9f4d642db;
  };

  outputs = inputs:
    inputs.godev.inputs.goreleaser.inputs.pkg.main rec {
      src = ./.;
      defaultPackage = ctx:
        let
          gomod2nixOverlay = inputs.gomod2nix.overlays.default;

          goPkgs = import inputs.latest {
            system = ctx.system;
            overlays = [ gomod2nixOverlay ];
          };
        in
        ctx.wrap.nullBuilder {
          propagatedBuildInputs = with ctx.pkgs; [
            goPkgs.gomod2nix
            bashInteractive
            inputs.godev.defaultPackage.${ctx.system}
            inputs.nodedev.defaultPackage.${ctx.system}
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
