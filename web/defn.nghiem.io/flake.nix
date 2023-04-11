{
  inputs = {
    nodedev.url = github:defn/m/pkg-nodedev-0.0.43?dir=pkg/nodedev;
  };

  outputs = inputs: inputs.nodedev.inputs.pkg.main rec {
    src = ./.;

    packages = ctx: rec {
      devShell = ctx: ctx.wrap.devShell {
        devInputs = [
          (defaultPackage ctx)
        ];
      };
    };

    defaultPackage = ctx: ctx.wrap.nullBuilder {
      propagatedBuildInputs =
        let
          flakeInputs = [
            inputs.nodedev.defaultPackage.${ctx.system}
          ];
        in
        flakeInputs ++ ctx.commands;
    };
  };
}
