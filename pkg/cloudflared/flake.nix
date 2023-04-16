{
  inputs.pkg.url = github:defn/m/pkg-pkg-0.0.5?dir=pkg/pkg;
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
        sha256 = "sha256-VGLxHqZceE9mqCKBgDhYkgTq9sVe/HNV9KYPbWea8Ss="; # x86_64-linux
      };
      "aarch64-linux" = rec {
        os = "linux";
        arch = "arm64";
        sha256 = "sha256-rqcsxDR9tIA1GCXXAeyZB+Lw2SdjMy0+rKxs3LKDHIY="; # aarch64-linux
      };
      "x86_64-darwin" = rec {
        os = "darwin";
        arch = "amd64";
        sha256 = "sha256-olsjplGjHiSVDbCykpf7BahdxVrw5GoMR9gnWQAwoIk="; # x86_64-darwin
      };
      "aarch64-darwin" = rec {
        os = "darwin";
        arch = "amd64";
        sha256 = "sha256-olsjplGjHiSVDbCykpf7BahdxVrw5GoMR9gnWQAwoIk="; # aarch64-darwin
      };
    };
  };
}
