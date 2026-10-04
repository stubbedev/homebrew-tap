class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.75"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.75/harness_darwin_amd64"
      sha256 "46146d67055ad069c22c845814820162d50205245a1387ac4cf03038163d17e6"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.75/harness_darwin_arm64"
      sha256 "c3b2ab5997415bb0ac8ac0dfcfb99a5c38f416f8106e10be32502cfbc9b8749a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.75/harness_linux_amd64"
      sha256 "f85a331aa13c477c3a43a360ec671417d4b744f0037e866c2b10c5c4da69d623"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.75/harness_linux_arm64"
      sha256 "f99c3e913e8fc6d5c6b2e7c94f46dda402792611927d6bb74cb501e0ae734ad3"
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
