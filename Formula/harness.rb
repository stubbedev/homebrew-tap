class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.69"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.69/harness_darwin_amd64"
      sha256 "07acf4c4e66cf227f12bb9ff78578d3db1f0b690ddde39a4fc7078834b698d63"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.69/harness_darwin_arm64"
      sha256 "8e229a6fe0407752962616ea8673997e6e643bcb19822651c70dfb9c56ae9464"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.69/harness_linux_amd64"
      sha256 "0f3984f14db6ce17aa1b2869628ed4dfc1b6821660c962b577ed9bd6e1542a67"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.69/harness_linux_arm64"
      sha256 "68bb75a4a3be19a89e912e67aa17d8cfce84d6c9006e0ff1217c0506131af891"
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
