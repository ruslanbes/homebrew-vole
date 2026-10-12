class Vole < Formula
  desc "Record why each piece of software is installed on this Mac"
  homepage "https://github.com/ruslanbes/vole"
  url "https://github.com/ruslanbes/vole/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "1ca8c0aef0bfd9fd1c37f1219347656882ac72d447fa9046802b6f40bf1cb8fa"
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
  end

  test do
    assert_match "vole #{version}", shell_output("#{bin}/vole --version")
  end
end
