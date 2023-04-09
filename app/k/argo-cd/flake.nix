{
  inputs.app.url = github:defn/m/;
  outputs = inputs: inputs.app.kustomizeMain rec { src = ./.; };
}
