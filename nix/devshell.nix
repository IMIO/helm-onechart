{ inputs, ... }:
{
  imports = [ inputs.devshell.flakeModule ];
  perSystem =
    { config, pkgs, ... }:
    {
      devshells.default = {
        packages = [
          pkgs.git
          pkgs.kubernetes-helm
          pkgs.gnumake
        ];
        devshell.startup.pre-commit.text = config.pre-commit.installationScript;
        commands = [
          {
            name = "fmt";
            help = "Format code";
            command = "nix fmt";
            category = "check";
          }
          {
            name = "check";
            help = "Run all checks";
            command = "nix flake -L check -v";
            category = "check";
          }
          {
            name = "lint";
            help = "Lint code";
            command = "pre-commit run --all-files";
            category = "check";
          }
        ];
      };
    };
}
