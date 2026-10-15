class Vole < Formula
  desc "Record why each piece of software is installed on this Mac"
  homepage "https://github.com/ruslanbes/vole"
  url "https://github.com/ruslanbes/vole/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "258875c42ae142b20e01541b308a3ba6bb08e9febe0f64fcb133ceccb4c701ec"
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
