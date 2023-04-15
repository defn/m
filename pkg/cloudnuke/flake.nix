{
  inputs.pkg.url = github:defn/m/pkg-pkg-0.0.3?dir=pkg/pkg;
  outputs = inputs: inputs.pkg.downloadMain rec {
    src = ./.;

    url_template = input: "https://github.com/gruntwork-io/cloud-nuke/releases/download/v${input.vendor}/cloud-nuke_${input.os}_${input.arch}";

    installPhase = pkg: ''
      install -m 0755 -d $out $out/bin
      install -m 0755 $src $out/bin/cloud-nuke
    '';

    downloads = {
      options = pkg: {
        dontUnpack = true;
        dontFixup = true;
      };

      "x86_64-linux" = {
        os = "linux";
        arch = "amd64";
        sha256 = "sha256-Poa2VVkVceHry4+uo4l/vCE2IVsWIDduBNu30mf+IYA="; # x86_64-linux
      };
      "aarch64-linux" = {
        os = "linux";
        arch = "arm64";
        sha256 = "sha256-WedSWo7bPK70wSYNGn9b4es6a/90tCaKpssVYx0B33g="; # aarch64-linux
      };
      "x86_64-darwin" = {
        os = "darwin";
        arch = "amd64";
        sha256 = "sha256-Y/rOjdKkLSJGeBjvxrzwQjbkMMh9dte2Nzr8YC9OeO8="; # x86_64-darwin
      };
      "aarch64-darwin" = {
        os = "darwin";
        arch = "arm64";
        sha256 = "sha256-KeqTcizkroGX8o5Z+SqBewWP9ObHGuFAA2UP1Iy7U9E="; # aarch64-darwin
      };
    };
  };
}
