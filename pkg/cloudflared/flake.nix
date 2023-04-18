{
  inputs.pkg.url = github:defn/m/pkg-pkg-0.0.6?dir=pkg/pkg;
  outputs = inputs: inputs.pkg.downloadMain rec {
    src = ./.;

    url_template = input:
      if input.os == "linux" then
        "https://github.com/cloudflare/cloudflared/releases/download/${input.vendor}/cloudflared-${input.os}-${input.arch}"
      else
        "https://github.com/cloudflare/cloudflared/releases/download/${input.vendor}/cloudflared-${input.os}-${input.arch}.tgz";

    installPhase = pkg: ''
      install -m 0755 -d $out $out/bin
      case "$src" in
        *.tgz)
          tar xvfz $src
          install -m 0755 cloudflared $out/bin/cloudflared
          ;;
        *)
          install -m 0755 $src $out/bin/cloudflared
          ;;
      esac
    '';

    downloads = {
      options = pkg: { dontUnpack = true; dontFixup = true; };

      "x86_64-linux" = rec {
        os = "linux";
        arch = "amd64";
        sha256 = "sha256-ZkJbeCiOtaAd//n7bVf3O1AVTzPnQQwLn/8DpAi8SQ4="; # x86_64-linux
      };
      "aarch64-linux" = rec {
        os = "linux";
        arch = "arm64";
        sha256 = "sha256-gxgiLYy6b1Bky13AHqeG1/EHsmsg7HN7MUHSmFZuQY0="; # aarch64-linux
      };
      "x86_64-darwin" = rec {
        os = "darwin";
        arch = "amd64";
        sha256 = "sha256-PXZ/eO0eFTBJ0rF8/8bvD5smjYRzQS/Btik58LVGrnE="; # x86_64-darwin
      };
      "aarch64-darwin" = rec {
        os = "darwin";
        arch = "amd64";
        sha256 = "sha256-PXZ/eO0eFTBJ0rF8/8bvD5smjYRzQS/Btik58LVGrnE="; # aarch64-darwin
      };
    };
  };
}
