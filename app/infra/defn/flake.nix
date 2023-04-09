{
  inputs.infra.url = github:defn/m/?dir=app/cmd/infra
  outputs = inputs: inputs.infra.inputs.app.cdktfMain rec {
    src = ./.;
    infra = inputs.infra;
    infra_cli = "infra";
  };
}
