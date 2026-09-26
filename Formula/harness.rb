class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.63"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.63/harness_darwin_amd64"
      sha256 "a1f786269264ea5ecce0b4623d76d8f3ef05a292f228082ce5dcae0f9cd381b3"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.63/harness_darwin_arm64"
      sha256 "5bc1d675c3470c947ecddb01755df12d1d2faa1443fe0026e388cfcf8f4e71c0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.63/harness_linux_amd64"
      sha256 "3f2d58e2a84222f8b5e053a764260f24d2c42c5996ace475ee82a0589431767a"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.63/harness_linux_arm64"
      sha256 "baaab80746113fa1c6b16aef8a9e5124d69d4adbf839717a12b586481278295a"
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
