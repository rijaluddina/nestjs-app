{ pkgs, ... }: {
  packages = [
    pkgs.nodejs_20
  ];

  bootstrap = ''
    set -e

    cp -R ${./.} "$out"

    cd "$out"/*
    npm install
  '';
}
