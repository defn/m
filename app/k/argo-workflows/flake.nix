{
  inputs.app.url = github:defn/m/app-0.0.34;
  outputs = inputs: inputs.app.kustomizeMain rec { src = ./.; };
}
