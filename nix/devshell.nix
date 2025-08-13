{ inputs, ... }:
{
  imports = [ inputs.devshell.flakeModule ];
  perSystem =
    { pkgs, ... }:
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
        commands = [
          {
            name = "check";
            help = "Run all helm checks";
            command = "helm unittest .";
            category = "check";
          }
        ];
      };
    };
}
