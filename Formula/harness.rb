class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.60"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.60/harness_darwin_amd64"
      sha256 "56966ce4b61be82ca6f7199ff21e65e53cb1dcc7ce9d448b93dc6b4ddb09b69c"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.60/harness_darwin_arm64"
      sha256 "ef9d85eb94aee6961edb33451f8be43df14ef7199aabe71ef12bf238a3b87727"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.60/harness_linux_amd64"
      sha256 "47987f5d2a0c97b318577f420c0e1a0d3c4f7dd859f9a3a200f5fc61de6efeac"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.60/harness_linux_arm64"
      sha256 "0d9eb0b2f1ede3796593fe0d83fc62d57eb6f8c7af5d545ddb1364690d59c02c"
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
