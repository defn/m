{
  inputs.pkg.url = github:defn/m/pkg-pkg-0.0.6?dir=pkg/pkg;
  outputs = inputs: inputs.pkg.downloadMain rec {
    src = ./.;

    url_template = input: "https://github.com/vmware-tanzu/velero/releases/download/v${input.vendor}/velero-v${input.vendor}-${input.os}-${input.arch}.tar.gz";

    installPhase = pkg: ''
      install -m 0755 -d $out $out/bin
      install -m 0755 */velero $out/bin/velero
    '';

    downloads = {


      "x86_64-linux" = {
        os = "linux";
        arch = "amd64";
        sha256 = "sha256-unfypCYYjxeY116I8XWZU+QZ8v8OrX6DzHULUEk+TOY="; # x86_64-linux
      };
      "aarch64-linux" = {
        os = "linux";
        arch = "arm64";
        sha256 = "sha256-kXXphCvizRJoNyI4UalrGgQ4aUd5TgzlhYlupCd/lmU="; # aarch64-linux
      };
      "x86_64-darwin" = {
        os = "darwin";
        arch = "amd64";
        sha256 = "sha256-I1pZqbQl0E/Y5MzQNePAI1o0Qc3FCQNVAeL2qKJN0HA="; # x86_64-darwin
      };
      "aarch64-darwin" = {
        os = "darwin";
        arch = "amd64";
        sha256 = "sha256-I1pZqbQl0E/Y5MzQNePAI1o0Qc3FCQNVAeL2qKJN0HA="; # aarch64-darwin
      };
    };
  };
}
