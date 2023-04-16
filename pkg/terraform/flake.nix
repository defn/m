{
  inputs.pkg.url = github:defn/m/pkg-pkg-0.0.5?dir=pkg/pkg;
  outputs = inputs: inputs.pkg.downloadMain rec {
    src = ./.;

    url_template = input: "https://releases.hashicorp.com/terraform/${input.vendor}/terraform_${input.vendor}_${input.os}_${input.arch}.zip";

    installPhase = pkg: ''
      install -m 0755 -d $out $out/bin
      unzip $src
      install -m 0755 terraform $out/bin/terraform
    '';

    downloads = {
      options = pkg: {
        dontUnpack = true;
        dontFixup = true;
        buildInputs = with pkg.ctx.pkgs; [ unzip ];
      };

      "x86_64-linux" = {
        os = "linux";
        arch = "amd64";
        sha256 = "sha256-zhDpQc0RVUsVoYnNABkcBavCDf+GVZnTYb24Y8X0Bqk="; # x86_64-linux
      };
      "aarch64-linux" = {
        os = "linux";
        arch = "arm64";
        sha256 = "sha256-yixI9Rj3L+9mglUVDMXmO5JUXtxioFk5u/+KNQvOs1c="; # aarch64-linux
      };
      "x86_64-darwin" = {
        os = "darwin";
        arch = "amd64";
        sha256 = "sha256-gI5U2CZzfpoMp5u+KTMOUNNiK77rJgZsY7NxopFzFxE="; # x86_64-darwin
      };
      "aarch64-darwin" = {
        os = "darwin";
        arch = "arm64";
        sha256 = "sha256-cQTZ0TYyqmG0lKNJxYkEjSG9VQ5XlATDpBxJMuTWqpc="; # aarch64-darwin
      };
    };
  };
}
