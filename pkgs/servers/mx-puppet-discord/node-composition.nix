# This file has been generated by node2nix 1.9.0. Do not edit!

{pkgs ? import ../../.. {
    inherit system;
  }, system ? builtins.currentSystem, nodejs ? pkgs."nodejs-14_x"}:

let
  nodeEnv = import ../../development/node-packages/node-env.nix {
    inherit (pkgs) stdenv lib python2 runCommand writeTextFile writeShellScript;
    inherit pkgs nodejs;
    libtool = if pkgs.stdenv.isDarwin then pkgs.darwin.cctools else null;
  };
in
import ./node-packages.nix {
  inherit (pkgs) fetchurl nix-gitignore stdenv lib fetchgit;
  inherit nodeEnv;
}
