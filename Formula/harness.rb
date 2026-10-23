class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.82"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/harness/releases/download/v0.0.82/harness_darwin_arm64"
      sha256 "2cc0c9a991f9cb1c4e3c3e1fe9897c7cf11bddba90a48a20042ecab296bb7968"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.82/harness_linux_amd64"
      sha256 "5a1372b10eeab1317284ca040644bb254f4ce5c78a215ee917030c9f776c45c0"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.82/harness_linux_arm64"
      sha256 "fdbd84a9cf0a8f7317715f5c774f128a45190205a19807b8b58e2afde3cff7ff"
    end
  end

  def install
    bin.install asset => "harness"
    chmod 0555, bin/"harness"
  end

  def test
    assert_match version.to_s, shell_output("#{bin}/harness --version")
  end

  def asset
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"
    "harness_#{os}_#{arch}"
  end
end
