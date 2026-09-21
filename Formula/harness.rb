class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.40"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.40/harness_darwin_amd64"
      sha256 "44bcb0b43db6d2c01361d664a82a9fef86e22dc6c42bb9f650550d8634d52e89"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.40/harness_darwin_arm64"
      sha256 "e55d75c3c1b04ac8b5fbbdb4813a8a29dccf5085659cdbd6aa7af4a046a0651e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.40/harness_linux_amd64"
      sha256 "0b870e70cebb10c2a82c19a2f143baed68f862c79ead15ef9c60d864a4205899"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.40/harness_linux_arm64"
      sha256 "47b2c01f97eaefa553abf66b4c87c39051c5a413a57c7acfd92bfa8d76b56b74"
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
