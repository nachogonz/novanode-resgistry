class Novanode < Formula
  desc "AI token usage status CLI for Claude, Codex and Cursor"
  homepage "https://github.com/nachogonz/novanode-resgistry#readme"
  url "https://registry.npmjs.org/@nakdev-npm/novanode/-/novanode-1.0.4.tgz"
  sha256 "02c541acb8571725eff3ead2dc023ae4f48b4890e8d5b77286765bf8169d78d2"
  license "MIT"

  depends_on "python@3.12"

  def install
    libexec.install Dir["*"]

    (bin/"nn-usage").write <<~SH
      #!/bin/bash
      export PATH="#{formula_opt_bin("python@3.12")}:$PATH"
      exec "#{libexec}/bin/nn-usage" "$@"
    SH

    (bin/"novanode").write <<~SH
      #!/bin/bash
      exec "#{libexec}/bin/novanode" "$@"
    SH
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/novanode --version").strip
    assert_equal version.to_s, shell_output("#{bin}/nn-usage --version").strip
    assert_match "Usage:", shell_output("#{bin}/nn-usage --help")
  end
end
