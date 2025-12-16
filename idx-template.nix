{ pkgs, packageManager ? "npm", ... }: {

  packages = [
    pkgs.nodejs_20
    pkgs.nodePackages.npm
    pkgs.nodePackages.pnpm
    pkgs.yarn
  ];

  bootstrap = ''
    set -e

    echo "Creating NestJS app..."
    npx @nestjs/cli new "$out" \
      --skip-git \
      --package-manager ${packageManager} \
      --skip-install

    mkdir -p "$out"/.idx
    chmod -R u+w "$out"

    # copy dev.nix if exists
    if [ -f ${./.idx/dev.nix} ]; then
      cp ${./.idx/dev.nix} "$out"/.idx/dev.nix
    fi

    chmod -R +w "$out"

    ${
     if packageManager == "npm" then
       "( cd $out && npm i --package-lock-only --ignore-scripts )"
     else
       ""
    }
    
  '';
}
