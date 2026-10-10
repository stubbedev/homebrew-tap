class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.78"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.78/harness_darwin_amd64"
      sha256 "68d4590935ae0bf607ad336fda3f7a1a178305f3d2457b4841181f57926eb984"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.78/harness_darwin_arm64"
      sha256 "245947d83ef8ef2fb3e7601052e8fa5295dd7d003636d354340f329358f7ad91"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.78/harness_linux_amd64"
      sha256 "db39ba512ce31b24aeaa3c2e1513dce135210308f4208b216dba05a99409fca9"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.78/harness_linux_arm64"
      sha256 "97a65ad5bf10bb48f38ff156fd8094899cb306e314072667f5a514b35ce16334"
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
