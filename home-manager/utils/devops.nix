{ pkgs, lib, ... }:

{
  home = {
    packages = with pkgs; [
      argo
      awscli2
      istioctl
      docker
      kubectl
      kubernetes-helm
      # lens
      minikube
      # terragrunt
      # terraform
      ansible
    ];
  };
}

