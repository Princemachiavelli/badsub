{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.stdenvNoCC.mkDerivation {
      name = "example";
      src = ./.;
      dontBuild = true;
      installPhase = ''
        cp ./submodule_a/README.md $out 
      '';
    };

  };
}
