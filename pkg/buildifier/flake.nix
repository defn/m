{
  inputs.pkg.url = github:defn/m/pkg-pkg-0.0.3?dir=pkg/pkg;
  outputs = inputs: inputs.pkg.downloadMain rec {
    src = ./.;

    url_template = input: "https://github.com/bazelbuild/buildtools/releases/download/${input.vendor}/buildifier-${input.os}-${input.arch}";

    installPhase = pkg: ''
      install -m 0755 -d $out $out/bin
      install -m 0755 $src $out/bin/buildifier
    '';

    downloads = {
      options = pkg: {
        dontUnpack = true;
      };

      "x86_64-linux" = {
        os = "linux";
        arch = "amd64";
        sha256 = "sha256-C1Gmy4G8O1FGbqIhAFOZJlSYepBwY9DCucA74p3lLv8="; # x86_64-linux
      };
      "aarch64-linux" = {
        os = "linux";
        arch = "arm64";
        sha256 = "sha256-Ws3WVoQQX3PRxl7kc39s84iv/4Z064gEWqPCBIEbAvM="; # aarch64-linux
      };
      "x86_64-darwin" = {
        os = "darwin";
        arch = "amd64";
        sha256 = "sha256-/GFFXyE3yOoWwpmgHNHTv6507asdorl3eJIWkVBKKAk="; # x86_64-darwin
      };
      "aarch64-darwin" = {
        os = "darwin";
        arch = "arm64";
        sha256 = "sha256-Du827dmXmPpP9wmSV6hH7KrZag70GldI6Qkc05PuILw="; # aarch64-darwin
      };
    };
  };
}
