
{ config, pkgs, ... } : 

{
    enviroment.systemPackages = with pkgs; [
        # Shell:
        zsh

        # Text editors:
        vim

        # Basic CLI tools: 
        wget 
        curl 
        git 
    ];
}
