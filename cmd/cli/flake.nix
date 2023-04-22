{
  inputs.app.url = github:defn/m/app-app-0.0.42?dir=app/app;
  outputs = inputs: inputs.app.goMain rec {
    src = ./.;

    generateCompletion = "1";
  };
}
