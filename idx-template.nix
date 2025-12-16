# No user-configurable parameters
{ pkgs, ... }: {
  packages = [
    pkgs.nodejs_20
  ];

  bootstrap = ''
    set -e

    cp -rf ${./.} "$out"

    chmod -R +w "$out"

    rm -rf \
      "$out/.git" \
      "$out/idx-template.nix" \
      "$out/idx-template.json"

  '';
}

