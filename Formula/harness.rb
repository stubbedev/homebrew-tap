class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.56"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.56/harness_darwin_amd64"
      sha256 "22815a6eb4c1f5ea171856427d6b659f7e77acb0cdba8e063c918740f3291745"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.56/harness_darwin_arm64"
      sha256 "61a64e06bcbcce2b3d3322db219576d5075432262056f3a47b1f1aff9f2afb94"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.56/harness_linux_amd64"
      sha256 "842e7ff9ded262d3505d9707631335cc30d19d88e1885d749e03db3adaeb16de"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.56/harness_linux_arm64"
      sha256 "c556a2291ec86823086e5310d1090a73beeb42c8c9c7810a935f5cfea7e2e764"
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
