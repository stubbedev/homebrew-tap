class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.52"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.52/harness_darwin_amd64"
      sha256 "eb16281c5669f02c59c1e519a84b22cb1b5e28d4a3e306357b7a0a3a55e9983b"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.52/harness_darwin_arm64"
      sha256 "ac134f678f448016e143dfe35e4c4161b524f0c60af0a5c87005a15fbb1212ca"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.52/harness_linux_amd64"
      sha256 "01026929049d21ea8eca1b92322938121129f658c28f849c688293a5d7419989"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.52/harness_linux_arm64"
      sha256 "c99e53efa62aee12f2a17853cb5036ff1ce9cbf8a1970c173ab3a8e45a52ba31"
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
