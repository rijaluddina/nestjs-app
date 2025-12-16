{ pkgs, ... }: {
  packages = [
    pkgs.nodejs_20
  ];

  bootstrap = ''
  set -e

  mkdir -p "$out"
  rsync -av \
    --exclude idx-template.nix \
    --exclude idx-template.json \
    ${./.}/ "$out/"

  cd "$out"
  npm install
'';

}
