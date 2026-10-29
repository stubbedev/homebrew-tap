class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.89"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/harness/releases/download/v0.0.89/harness_darwin_arm64"
      sha256 "dc56e51040b86c51c1213b29a2ee4a1bdef9f702c879541aa6d20c1b598815bc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.89/harness_linux_amd64"
      sha256 "a418d7c69e9ada42279e3a156f5b0a13b9cc7cc894ac4e5faa52cd972554adae"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.89/harness_linux_arm64"
      sha256 "9de301b858556bc1a0b39b461b8aac249e5596d632c163447412f016aae50f1c"
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
