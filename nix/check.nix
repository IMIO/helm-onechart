{ inputs, ... }:
{
  imports = [ inputs.pre-commit-nix.flakeModule ];

  perSystem = _: {
    pre-commit = {
      settings = {
        hooks = {
          nil.enable = true;
          deadnix.enable = true;
          statix.enable = true;
          hadolint.enable = true;
          shellcheck.enable = true;
          shfmt.enable = true;
          markdownlint = {
            enable = true;
            settings.configuration = {
              MD013 = {
                line_length = 120;
              };
            };
          };
          treefmt.enable = true;
        };
        settings = {
          markdownlint.config = {
            exclude = "README.md";
            MD013 = {
              line_length = 120;
            };
          };
        };
      };
    };
  };
}
