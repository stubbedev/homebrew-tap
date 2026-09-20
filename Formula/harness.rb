class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.33"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.33/harness_darwin_amd64"
      sha256 "60947d3a794facb81d682acdf3356bf7110989cd02b0b02380574ee1913bf5bb"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.33/harness_darwin_arm64"
      sha256 "a206152420d44d0e0b21e74513d4fa6cf5c922c367b0e397515f1fc296e43623"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.33/harness_linux_amd64"
      sha256 "383528678d5e3d1ff9d9d9a4890b2866f4927f42254936eb7e7e04232125d9cf"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.33/harness_linux_arm64"
      sha256 "b3e774108e3ea30f558ba165ddba9e780c38a92b62a94f598dd4530710b25461"
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
