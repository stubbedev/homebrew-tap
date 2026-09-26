class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.61"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.61/harness_darwin_amd64"
      sha256 "e4d412a10a0b441530ca284c32e0c3e8220bb298e3dac5e89e16df8c6686de00"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.61/harness_darwin_arm64"
      sha256 "07c9e918551017682304563ac147ed01dc9ac9917ad5d252d4d52bbc4f67d6f5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.61/harness_linux_amd64"
      sha256 "9ae9696b6dc3b0df8dccde789775abe43f86cd3d876e7c1cae3457c017ecf2b2"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.61/harness_linux_arm64"
      sha256 "6720ffe0485bebebe463132191cf92679a69e9fc61c1576d03be86c08a6fb329"
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
