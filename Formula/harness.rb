class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.32"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.32/harness_darwin_amd64"
      sha256 "e735bf718379dd3b8350f31c6db16c37d5cb1a73a571cf5dcd30d9abbe87043e"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.32/harness_darwin_arm64"
      sha256 "a729fbc94cf361f275044eda19c2ac94e36b4c1880d3ef7159d719a50881159c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.32/harness_linux_amd64"
      sha256 "02ce71cc31c53ebc23ebafa7d300efd46a96ba796f5d2baca22e3767977c5807"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.32/harness_linux_arm64"
      sha256 "a4b49aa28742d6b22668d5f40030e1505b1edec0a14b41f10e9d665b12a58376"
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
