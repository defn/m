{
  inputs.app.url = github:defn/m/app-app-0.0.40?dir=app/app;
  outputs = inputs: inputs.app.kustomizeMain rec { src = ./.; };
}
