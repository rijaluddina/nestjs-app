{ pkgs, packageManager ? "npm", ... }: {

  packages = [
    pkgs.nodejs_20
    pkgs.nodePackages.npm
    pkgs.nodePackages.pnpm
    pkgs.yarn
  ];

  bootstrap = ''
    set -e
    npx --yes @nestjs/cli new "$out" \
      --skip-git \
      --package-manager ${packageManager}

    mkdir -p "$out/.idx"
    chmod -R u+w "$out"

    cp ${./.idx/dev.nix} "$out/.idx/dev.nix"

    chmod -R +w "$out"
  '';
}

