{
  inputs = {
    cue.url = github:defn/m/pkg-cue-0.4.3-3?dir=pkg/cue;
    hof.url = github:defn/m/pkg-hof-0.6.8-beta.12-3?dir=pkg/hof;
  };

  outputs = inputs: inputs.cue.inputs.pkg.main rec {
    src = ./.;

    defaultPackage = ctx: ctx.wrap.bashBuilder {
      src = ./bin;

      installPhase = ''
        mkdir -p $out/bin
        cp -a $src/* $out/bin/
        chmod 755 $out/bin/*
      '';

      propagatedBuildInputs = [
        inputs.cue.defaultPackage.${ctx.system}
        inputs.hof.defaultPackage.${ctx.system}
      ];
    };
  };
}
