class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.85"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/harness/releases/download/v0.0.85/harness_darwin_arm64"
      sha256 "9579c9fc4e6d2fdccd0ba358f8a7a132349bcb67dd99dd417246e62b641c0da9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.85/harness_linux_amd64"
      sha256 "0fd9a2adb1d7722ddf3e9fbaadb80829e3f730d98e90b6ed921ce523ad93eac1"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.85/harness_linux_arm64"
      sha256 "e0331aff8c443c5e6f6958f482882e6c9fc5944553d3cf312ea1fa6f1dafd733"
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
