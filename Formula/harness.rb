class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.30"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.30/harness_darwin_amd64"
      sha256 "41e6c50f727def9f26a212c6dabcc43b3f69a3a58170b0588271ac502d1be64e"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.30/harness_darwin_arm64"
      sha256 "b0a5bf55f689f372b642dd4c9a2b95873ec36d115b0e1a03e88254ee4f70a0cd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.30/harness_linux_amd64"
      sha256 "980ed7d50764017b6c5d1969233ec27358c2c3f530e875cb6f50258045c93ec7"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.30/harness_linux_arm64"
      sha256 "21473d91c494907f5a3e67249c818f1e73ae4f3940ca293662d8ebcebd187671"
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
