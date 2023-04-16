{
  inputs = {
    c.url = github:defn/m/pkg-c-0.4.47?dir=pkg/c;
    n.url = github:defn/m/pkg-n-0.0.91?dir=pkg/n;
    tf.url = github:defn/m/pkg-tf-0.0.47?dir=pkg/tf;
    gum.url = github:defn/m/pkg-gum-0.10.0-3?dir=pkg/gum;
    glow.url = github:defn/m/pkg-glow-1.5.0-3?dir=pkg/glow;
  };

  outputs = inputs: inputs.c.inputs.cue.inputs.pkg.main rec {
    src = ./.;

    defaultPackage = ctx: ctx.wrap.nullBuilder {
      propagatedBuildInputs = with ctx.pkgs; [
        inputs.c.defaultPackage.${ctx.system}
        inputs.n.defaultPackage.${ctx.system}
        inputs.tf.defaultPackage.${ctx.system}
        inputs.gum.defaultPackage.${ctx.system}
        inputs.glow.defaultPackage.${ctx.system}
        jq
        yq
        gron
        fzf
        bashInteractive
      ];
    };
  };
}
