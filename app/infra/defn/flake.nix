{
  inputs.infra.url = github:defn/m/app-cmd-infra-0.0.25?dir=app/cmd/infra;
  outputs = inputs: inputs.infra.inputs.app.cdktfMain rec {
    src = ./.;
    infra = inputs.infra;
    infra_cli = "infra";
  };
}
