{pkgs, ...}: {
  programs.git = {
    enable = true;
    userEmail = "aurora-cichos7@gmail.com";
    userName = "aurora-cichos";

    extraConfig = {
      credential.helper = "${
        pkgs.git.override { withLibsecret = true; }
      }/bin/git-credential-libsecret";
    };
  };
}
