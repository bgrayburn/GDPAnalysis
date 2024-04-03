{ pkgs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  # https://devenv.sh/packages/
  packages = with pkgs; [
    texliveFull
    git
    python311Packages.jupyterlab
  ];

  services.mongodb.enable = true;

  # https://devenv.sh/scripts/
  scripts.hello.exec = "echo hello from $GREET";
  scripts.show-notebook.exec = "jupyter lab exploratory.ipynb";
  scripts.generate-html.exec = "jupyter convert --to html exploratory.ipynb";

  enterShell = ''
    hello
    git --version
  '';

  # https://devenv.sh/languages/
  # languages.nix.enable = true;
  languages.python = {
    enable = true;
    venv.enable = true;
    venv.requirements = ./requirements.txt;
  };

  # https://devenv.sh/pre-commit-hooks/
  # pre-commit.hooks.shellcheck.enable = true;

  # https://devenv.sh/processes/
  # processes.ping.exec = "ping example.com";

  # See full reference at https://devenv.sh/reference/options/
}
