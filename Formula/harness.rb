class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.86"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/harness/releases/download/v0.0.86/harness_darwin_arm64"
      sha256 "9aef7c01c90584d4348fd9aa58c2abeb1a064bbb303f1f8b8a382dcd56bf00e7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.86/harness_linux_amd64"
      sha256 "d3fb884cb7fc850b39ef02ad308af2ce8b3d104903442ac10d79bf94f8f63c3d"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.86/harness_linux_arm64"
      sha256 "fb26fcadc2b47d948d3cbff3f918925f8e9141cfecd40fb2fb6fc6e0648887be"
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
