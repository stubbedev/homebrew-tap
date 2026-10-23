class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.81"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/harness/releases/download/v0.0.81/harness_darwin_arm64"
      sha256 "07bd921afe9d33153e7a4463118d060fcb70dfefccf54cb027bcd5d4643f185e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.81/harness_linux_amd64"
      sha256 "7f76d3834266dca5ddb8fc4087335e35c9800d6a0a4435c599b731b4491fb325"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.81/harness_linux_arm64"
      sha256 "723514df05db0d4b77195b4057920e24dac623a0576d637264f1d08937be0d9e"
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
