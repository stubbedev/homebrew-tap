class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.34"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.34/harness_darwin_amd64"
      sha256 "04dfc7da5c66d9bbb6d60daac2d166d5ab5918efa0b21bc0ee76a41c3e1daabb"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.34/harness_darwin_arm64"
      sha256 "179539d67dd3f52c544a0b16aeaf456ca3559d5e8e2f2aea752bf2bcdddbe299"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.34/harness_linux_amd64"
      sha256 "a9ae8cb6c4843c5c2228c2558a45c1968914d2c8258725b8805636c6f6f83933"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.34/harness_linux_arm64"
      sha256 "06d1c523b4201a35e2e96be160b491680e868e4ec6ade1cab0e88b40479e91f5"
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
