{
  inputs.pkg.url = github:defn/m/pkg-pkg-0.0.3?dir=pkg/pkg;
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
        sha256 = "sha256-n7E9C5YReU2o1xaIpQsfLqIh/NXy9K1Sn4tF7pCbI3E="; # x86_64-linux
      };
      "aarch64-linux" = {
        os = "linux";
        arch = "arm64";
        sha256 = "sha256-+LFqe24fqqtUFop0+PNSS/IP9ac/4UtcrtSV/t1D7X0="; # aarch64-linux
      };
      "x86_64-darwin" = {
        os = "darwin";
        arch = "x86_64";
        sha256 = "sha256-hl4xrPy+qMQsxJMIyDoTDVM1MwbRRU6WXRwWYb1ErGs="; # x86_64-darwin
      };
      "aarch64-darwin" = {
        os = "darwin";
        arch = "arm64";
        sha256 = "sha256-pxZcxqk/YA4ha4v3zgtcHbyG4HYghQch6zKDk7ct2BE="; # aarch64-darwin
      };
    };
  };
}
