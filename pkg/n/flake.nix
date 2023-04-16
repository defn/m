{
  inputs = {
    pkg.url = github:defn/m/pkg-pkg-0.0.6?dir=pkg/pkg;
  };

  outputs = inputs: inputs.pkg.main rec {
    src = ./.;

    defaultPackage = ctx: ctx.wrap.bashBuilder {
      inherit src;

      installPhase = ''
        mkdir -p $out/bin
        cp -a $src/bin/n $src/bin/n-* $out/bin/
        chmod 755 $out/bin/*
      '';
    };
  };
}
