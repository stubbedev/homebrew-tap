class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.50"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.50/harness_darwin_amd64"
      sha256 "16c5756ee416f7d3cfeeaed34c69b464cf8d7e7186c3b9f6c834a7c213fc1ea3"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.50/harness_darwin_arm64"
      sha256 "74bc310b77957e83077796f56e85d54072efd739b40ecc6633cae7f64b83277b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.50/harness_linux_amd64"
      sha256 "3700c4fb6a71ecb57d3566effa034f5b447022bced90765157c348ad8b3d807a"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.50/harness_linux_arm64"
      sha256 "ec4e3925d035c16bbd029c8713281488aae4ea09dff0854aa74230e8d87efac1"
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
