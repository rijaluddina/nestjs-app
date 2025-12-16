{ pkgs, ... }: {
  packages = [
    pkgs.nodejs_20
  ];

  bootstrap = ''
    set -e

    echo "Copy project files (flatten)..."
    cp -R ${./.}/* "$out"

    cd "$out"

    echo "Install dependencies..."
    npm install
  '';
}
