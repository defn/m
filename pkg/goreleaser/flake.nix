{
  inputs.pkg.url = github:defn/m/pkg-pkg-0.0.5?dir=pkg/pkg;
  outputs = inputs: inputs.pkg.downloadMain rec {
    src = ./.;

    url_template = input: "https://github.com/goreleaser/goreleaser/releases/download/v${input.vendor}/goreleaser_${input.os}_${input.arch}.tar.gz";

    installPhase = pkg: ''
      install -m 0755 -d $out $out/bin
      install -m 0755 goreleaser $out/bin/goreleaser
    '';

    downloads = {


      "x86_64-linux" = {
        os = "linux";
        arch = "x86_64";
        sha256 = "sha256-fKIozyaYDPmqvOtSfACj5aDxyPftWbwrhcHD6lyEyaY="; # x86_64-linux
      };
      "aarch64-linux" = {
        os = "linux";
        arch = "arm64";
        sha256 = "sha256-qiKJbgnhW3G1GxaPNe68QZe8bECzCLp+fwyBImKHBU0="; # aarch64-linux
      };
      "x86_64-darwin" = {
        os = "darwin";
        arch = "x86_64";
        sha256 = "sha256-1aCmrLZrMwTAS4Fic1NA6zWf/DEJJNUIfFTZtjtxEz0="; # x86_64-darwin
      };
      "aarch64-darwin" = {
        os = "darwin";
        arch = "arm64";
        sha256 = "sha256-GQOh6ka3JZxjo2Tjc8+nyLtwnYyAd1xwGmXVdbMKwmg="; # aarch64-darwin
      };
    };
  };
}
