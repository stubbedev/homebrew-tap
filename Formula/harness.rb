class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.77"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.77/harness_darwin_amd64"
      sha256 "304ca786c30c02ad45a8f5d6c87ddec05eb9bec718c40ce6cc7227e34417cef2"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.77/harness_darwin_arm64"
      sha256 "f48ea589fd7d69c211845ecb71f90b073f01c9edb3d1abb87fbee818b8176fb3"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.77/harness_linux_amd64"
      sha256 "5dbeafced7449efed50bfc23ce2f7809d5af0b1e7c17aec387526857e5b5ad4c"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.77/harness_linux_arm64"
      sha256 "c0b3ccaa34867adbd95345b729d1c27397fa677a600290f078215012a0eb70fd"
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
