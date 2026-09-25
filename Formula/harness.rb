class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.59"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.59/harness_darwin_amd64"
      sha256 "171df0f2f02a051bee084eb4dc26eae4af595312a9541ff5d44f5375e59fe0d5"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.59/harness_darwin_arm64"
      sha256 "37949125b10cfbbd5b4034ac8a84e74d3f5cac6722edae4c9d2da7130ecceb9b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.59/harness_linux_amd64"
      sha256 "c9beef33cb0830689632cdf212985712e34fa49a53847f635fffa5ca23de3d96"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.59/harness_linux_arm64"
      sha256 "6497401b50e51c0192ebf8a91f25665cc1c542b82d912b46fff3ad1d2ec9c934"
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
