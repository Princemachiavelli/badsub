{
  description = "A very basic flake";

  inputs = {
    sub1.url = "git+ssh://git@github.com/Princemachiavelli/badsub?submodules=1&rev=6ab009abadbdab01fbca01fe6e30fb696bfe783a";
  };

  outputs = { self, nixpkgs, sub1 }: {

    packages.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.stdenvNoCC.mkDerivation {
      name = "example";
      src = ./.;
      dontBuild = true;
      installPhase = ''
        mkdir -p $out
        cp ./submodule_a/README.md $out/SUBMODULE_A_README.md 
	cp ${sub1}/submodule_a/README.md $out/sub1_readme.md
	cp ${sub1}/submodule_a/nested_sub/README.md $out/nested_sub_readme.md
      '';
    };

  };
}
