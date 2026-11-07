class Awsp < Formula
  desc "Lightweight cross-shell AWS profile switcher with SSO auto-login"
  homepage "https://github.com/ops4life/awsp"
  url "https://github.com/ops4life/awsp/archive/refs/tags/v1.15.0.tar.gz"
  sha256 "258d1572ff4c3e035ba419f0c5080fb947468207ff1636f640b43a0bf0029f4a"
  license "MIT"

  def install
    pkgshare.install "bin/awsp.sh"
    bash_completion.install "completions/awsp.bash" => "awsp"
    zsh_completion.install "completions/_awsp.zsh" => "_awsp"
  end

  def caveats
    <<~EOS
      awsp is a shell function and must be sourced. Add this to ~/.bashrc or ~/.zshrc:

        [ -f "#{opt_pkgshare}/awsp.sh" ] && . "#{opt_pkgshare}/awsp.sh"

      Then restart your shell. Upgrade with: brew upgrade awsp
    EOS
  end

  test do
    assert_match version.to_s, shell_output("bash -c '. #{pkgshare}/awsp.sh && awsp --version'")
  end
end
