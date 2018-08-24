{ stdenv, callPackage, makeFontsConf, gnome2 }:

let
  mkStudio = opts: callPackage (import ./common.nix opts) {
    fontsConf = makeFontsConf {
      fontDirectories = [];
    };
    inherit (gnome2) GConf gnome_vfs;
  };
  stableVersion = {
    version = "3.1.4.0"; # "Android Studio 3.1.4"
    build = "173.4907809";
    sha256Hash = "0xx6yprylmcb32ipmwdcfkgddlm1nrxi1w68miclvgrbk015brf2";
  };
  betaVersion = {
    version = "3.2.0.22"; # "Android Studio 3.2 Beta 5"
    build = "181.4913314";
    sha256Hash = "016nyn1pqviy089hg0dq7m4cqb39fdxdcy4zknkaq7dmgv1dj6x9";
  };
  latestVersion = { # canary & dev
    version = "3.3.0.6"; # "Android Studio 3.3 Canary 7"
    build = "182.4968538";
    sha256Hash = "159sya24p99pj9q0mj1sbcz2609ackz54x4pj3q1mxhiamsn1y2q";
  };
in rec {
  # Old alias
  preview = beta;

  # Attributes are named by their corresponding release channels

  stable = mkStudio (stableVersion // {
    channel = "stable";
    pname = "android-studio";
  });

  beta = mkStudio (betaVersion // {
    channel = "beta";
    pname = "android-studio-preview";
  });

  dev = mkStudio (latestVersion // {
    channel = "dev";
    pname = "android-studio-dev";
  });

  canary = mkStudio (latestVersion // {
    channel = "canary";
    pname = "android-studio-canary";
  });
}
