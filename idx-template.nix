{ pkgs, ... }: {
  packages = [
    pkgs.nodejs_20
  ];

  bootstrap = ''
    cp -r ${./.}/* "$out"
    cd "$out"

    # install dependency
    npm install
  '';
}
