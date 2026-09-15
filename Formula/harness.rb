class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.23"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.23/harness_darwin_amd64"
      sha256 "969a47dae422e7360d2fd17f050a1e979e0bf97ed5866e80cc1438b0b2c27f6b"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.23/harness_darwin_arm64"
      sha256 "766ee7385c16f8bb1e4399e3cf3de26b1b3613dbaf0d2a4cd04cac4f2e06f61c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.23/harness_linux_amd64"
      sha256 "961a3a534e485b86d7f5da633a351b681eeac92c5d2ed6749ad9c882992bd89f"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.23/harness_linux_arm64"
      sha256 "b14c842db52e2b29cfb11c3fc3df8e59b0ebdfd07df29cdfb81b2d29d8006960"
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
