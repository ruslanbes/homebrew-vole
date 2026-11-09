class Vole < Formula
  desc "Record why each piece of software is installed on this Mac"
  homepage "https://github.com/ruslanbes/vole"
  url "https://github.com/ruslanbes/vole/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "b7038808475848941798466bd35d55f6c78e8f93c652f1d27635224c08bc5342"
  license "Apache-2.0"

  depends_on :macos
  uses_from_macos "python"

  def install
    libexec.install "vole"
    (bin/"vole").write <<~PYTHON
      #!/usr/bin/env python3
      import sys
      sys.path.insert(0, "#{libexec}")
      from vole.cli import main
      raise SystemExit(main())
    PYTHON
    zsh_completion.install "completions/_vole"
  end

  test do
    assert_match "vole #{version}", shell_output("#{bin}/vole --version")
  end
end
