{
  sources ? import ./npins,
  pkgs ? import sources.nixpkgs { },
}:

let
  deploy-pypi = pkgs.writeShellApplication {
    name = "deploy-pypi";

    runtimeInputs = [
      (pkgs.python3.withPackages (ps: [
        ps.setuptools
        ps.build
        ps.twine
      ]))
    ];

    text = ''
      # Clean the repository
      rm -rf dist

      python -m build
      twine upload dist/*
    '';
  };
in

{
  devShell = pkgs.mkShell {
    name = "loadcredential.dev";

    packages = [ ];
  };

  publishShell = pkgs.mkShell {
    name = "loadcredential.publish";

    packages = [ deploy-pypi ];
  };
}
