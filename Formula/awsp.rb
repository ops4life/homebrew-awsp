class Awsp < Formula
  desc "Lightweight cross-shell AWS profile switcher with SSO auto-login"
  homepage "https://github.com/ops4life/awsp"
  url "https://github.com/ops4life/awsp/archive/refs/tags/v1.13.7.tar.gz"
  sha256 "200cd3153c6a053f1e02c7ebe574712df5a426f446fe7c339aa018a114e205e5"
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
