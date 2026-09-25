class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.57"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.57/harness_darwin_amd64"
      sha256 "fde5708d96e1858c6b359a0bbc0c8006af9f039c238fce4a4eb5b78c1ae868ae"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.57/harness_darwin_arm64"
      sha256 "47599d1b478ee1253f7a73cd724690a765c711f5c61aa2567a475aefe3caf563"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.57/harness_linux_amd64"
      sha256 "fe5bee03641a7eea534d50ce1c385e90c90b8ec7dbca61400b5dcaa6e8af817f"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.57/harness_linux_arm64"
      sha256 "7f9ab9c8722c50534bb83ba530d78fea408bfe788409f5b993d2673c2531b53f"
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
