{
  inputs = {
    tilt.url = github:defn/m/pkg-tilt-0.32.1-4?dir=pkg/tilt;
    nomad.url = github:defn/m/pkg-nomad-1.5.3-6?dir=pkg/nomad;
    boundary.url = github:defn/m/pkg-boundary-0.12.2-5?dir=pkg/boundary;
    vault.url = github:defn/m/pkg-vault-1.13.1-6?dir=pkg/vault;
    gh.url = github:defn/m/pkg-gh-2.27.0-5?dir=pkg/gh;
    earthly.url = github:defn/m/pkg-earthly-0.7.4-3?dir=pkg/earthly;
    buildkite.url = github:defn/m/pkg-buildkite-3.45.0-5?dir=pkg/buildkite;
    bk.url = github:defn/m/pkg-bk-2.0.0-6?dir=pkg/bk;
    buildevents.url = github:defn/m/pkg-buildevents-0.13.0-5?dir=pkg/buildevents;
    honeyvent.url = github:defn/m/pkg-honeyvent-1.1.3-5?dir=pkg/honeyvent;
    honeymarker.url = github:defn/m/pkg-honeymarker-0.2.10-5?dir=pkg/honeymarker;
    honeytail.url = github:defn/m/pkg-honeytail-1.8.3-3?dir=pkg/honeytail;
  };

  outputs = inputs: inputs.tilt.inputs.pkg.main rec {
    src = ./.;

    defaultPackage = ctx: ctx.wrap.nullBuilder {
      propagatedBuildInputs =
        let
          flakeInputs = [
            inputs.tilt.defaultPackage.${ctx.system}
            inputs.nomad.defaultPackage.${ctx.system}
            inputs.boundary.defaultPackage.${ctx.system}
            inputs.vault.defaultPackage.${ctx.system}
            inputs.gh.defaultPackage.${ctx.system}
            inputs.earthly.defaultPackage.${ctx.system}
            inputs.buildkite.defaultPackage.${ctx.system}
            inputs.bk.defaultPackage.${ctx.system}
            inputs.buildevents.defaultPackage.${ctx.system}
            inputs.honeyvent.defaultPackage.${ctx.system}
            inputs.honeymarker.defaultPackage.${ctx.system}
            inputs.honeytail.defaultPackage.${ctx.system}
          ];
        in
        flakeInputs;
    };
  };
}
