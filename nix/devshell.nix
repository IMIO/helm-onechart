{ inputs, ... }:
{
  imports = [ inputs.devshell.flakeModule ];
  perSystem =
    { config, pkgs, ... }:
    {
      devshells.default = {
        packages = with pkgs; [
          helm
          kubeval
          (wrapHelm kubernetes-helm {
            plugins = with kubernetes-helmPlugins; [
              helm-unittest
            ];
          })
          nil
          statix
          yamllint
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
            help = "Run all helm checks";
            command = "helm unittest .";
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
