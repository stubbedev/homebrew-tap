class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.26"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.26/harness_darwin_amd64"
      sha256 "f913c6ae87e194d5238eeb168831fe67b5b87cd6b8c8adbabaaf8db2fc1b9b6b"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.26/harness_darwin_arm64"
      sha256 "b9eba3a3ba5356d0a2620570b12c4b571d85fc0c5f70abef67627d6988c1eec9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.26/harness_linux_amd64"
      sha256 "8a7fc53b81b868d0af453cd186c48d91dd97edbe8e6172d5c474ef78b58e29ca"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.26/harness_linux_arm64"
      sha256 "42217a9e11dff921688526aafa8a3e08b5bc891c4e2aa8fc81fcf922ca0d152e"
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
