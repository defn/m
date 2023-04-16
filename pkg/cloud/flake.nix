{
  inputs = {
    terraform.url = github:defn/m/pkg-terraform-1.4.5-3?dir=pkg/terraform;
    packer.url = github:defn/m/pkg-packer-1.8.6-5?dir=pkg/packer;
    step.url = github:defn/m/pkg-step-0.24.3-3?dir=pkg/step;
    awscli.url = github:defn/m/pkg-awscli-2.11.13-3?dir=pkg/awscli;
  };

  outputs = inputs: inputs.terraform.inputs.pkg.main rec {
    src = ./.;

    defaultPackage = ctx: ctx.wrap.nullBuilder {
      propagatedBuildInputs =
        let
          flakeInputs = [
            inputs.awscli.defaultPackage.${ctx.system}
            inputs.terraform.defaultPackage.${ctx.system}
            inputs.packer.defaultPackage.${ctx.system}
            inputs.step.defaultPackage.${ctx.system}
          ];
        in
        flakeInputs;
    };
  };
}
