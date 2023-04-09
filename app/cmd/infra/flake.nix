{
  inputs.app.url = github:defn/m/app-;
  outputs = inputs: inputs.app.goMain rec {
    src = ./.;

    extendBuild = ctx: {
      propagatedBuildInputs = [
        inputs.app.inputs.nodedev.defaultPackage.${ctx.system}
      ];
    };
  };
}
