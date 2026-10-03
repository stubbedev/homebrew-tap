class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.71"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.71/harness_darwin_amd64"
      sha256 "4f1555afbeb2a95d2d9d4470c8df8a1546bdc0c0e7656cd11c862390e4a41a78"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.71/harness_darwin_arm64"
      sha256 "e7699b78f8dfcf8706dac3104892b97214b2a0989f5f965ae39002d75783d0ae"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.71/harness_linux_amd64"
      sha256 "87ecbf630ea9346b67fd84f55f4b703660c3498f847c4074ec68d75bd75124c0"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.71/harness_linux_arm64"
      sha256 "0a24405edde03c97b9a81191c652f6351094f56779bd7d48f66561d04f3400c1"
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
