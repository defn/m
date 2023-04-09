{
  inputs = {
    c.url = github:defn/m/?dir=pkg/c;
    n.url = github:defn/m/?dir=pkg/n;
    tf.url = github:defn/m/?dir=pkg/tf;
    gum.url = github:defn/m/?dir=pkg/gum;
    glow.url = github:defn/m/?dir=pkg/glow;
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
