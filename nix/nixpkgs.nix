{ self, inputs, ... }:
{
  perSystem =
    { system, ... }:
    {
      # customize nixpkgs instance
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [
          self.overlays.default
          inputs.imio.overlays.default
        ];
      };
    };
}
