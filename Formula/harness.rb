class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.58"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.58/harness_darwin_amd64"
      sha256 "8e1bee1b2cf3d8d2ce3046895c889f1202ac971f9977a10263dcea19b1ec727d"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.58/harness_darwin_arm64"
      sha256 "6c31207cad44a80b579ae615391205c3f7fbf58ca5beb9bfe6d74070fc8b20f4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.58/harness_linux_amd64"
      sha256 "b42292b98859cd72cf9bed66e744d5690d66428b887b53e2929b669f0ca949d8"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.58/harness_linux_arm64"
      sha256 "9349ba5f766a9de1db01d66b6e36348d3daea0ce217daf3d8d61b440e6f1d44c"
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
