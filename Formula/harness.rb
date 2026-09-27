class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.66"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.66/harness_darwin_amd64"
      sha256 "c2c4df2205096d0777e2e74513ed4d250439d02b651ca36fd4d687e4ff831aee"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.66/harness_darwin_arm64"
      sha256 "24ba0ab8470265f860409642d04b5299afb99038cf62bda6763a8ceb7a349196"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.66/harness_linux_amd64"
      sha256 "a7ed9b669070f4d6280f6bedabe6e83e69097d250b655222654f6a387a449f96"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.66/harness_linux_arm64"
      sha256 "e9c9a6cf421ce0d7bdb459cd17a46f5ac65b9e440f9c643bf1f516833aec5984"
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
