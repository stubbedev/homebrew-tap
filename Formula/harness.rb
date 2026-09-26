class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.62"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.62/harness_darwin_amd64"
      sha256 "8a94baa0a6ac99a81518df0a7cf4a2a57c5e95dc3ec910e50f79ec22cb6b83e4"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.62/harness_darwin_arm64"
      sha256 "528844a36e8a534471dfed8b2b8b817bcec439f7516441e4503077ad80fea57c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.62/harness_linux_amd64"
      sha256 "3eced866aea51b4f980b9e72246391608704860793aa302d02305787fbfcb2b8"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.62/harness_linux_arm64"
      sha256 "17d830a21413e6b033d74e3031fe82849e45d3e46db08a9a948738a2fa730846"
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
