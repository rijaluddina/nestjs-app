{ pkgs, version ? "latest", packageManager ? "npm", ... }: {

  packages = [ pkgs.nodejs_20 pkgs.yarn pkgs.nodePackages.pnpm pkgs.bun ];

  bootstrap = ''
		mkdir "$out"
		npx @nestjs/cli@${version} "$out" \
			--yes \
			--skip-install

		mkdir -p "$out"/.idx
		chmod -R u+w "$out"
		cp ${./.idx/dev.nix} "$out"/.idx/dev.nix
		cp -rf ${./.idx/airules.md} "$out/.idx/airules.md"
		cp -rf "$out/.idx/airules.md" "$out/GEMINI.md"
		chmod -R +w "$out"

		${
         if packageManager == "npm" then
           "( cd $out && npm i --package-lock-only --ignore-scripts )"
         else
           ""
        }
  '';
}
