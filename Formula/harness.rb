class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.21"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.21/harness_darwin_amd64"
      sha256 "9fd8b94d79f394e17ef37e6dde82d168f4ac85aec87fd28d04e2e1d1fc595b36"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.21/harness_darwin_arm64"
      sha256 "eba123fb5db8234c0fa901e71d02764bc4e3d664ce4435b5727c30456f8101ae"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.21/harness_linux_amd64"
      sha256 "3d4bc070785459e38f0916bb4f8a98b753dbe969e0c1477e1f7623fd58e6bd9a"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.21/harness_linux_arm64"
      sha256 "63c162a5fd26f53902a3bd02d6a15f177900a93f76f8835513e100a0b0c7a861"
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
