class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.38"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.38/harness_darwin_amd64"
      sha256 "90b800c69178fe2c8b09fc3bfe584bc2ccacc72557cf5366435463854e64db24"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.38/harness_darwin_arm64"
      sha256 "df48f9e3a20128cf50be7fedab87ee2593e0cc65ef9ee6cdbfb5698930bf2f91"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.38/harness_linux_amd64"
      sha256 "e4e2f1de983f577ea6fc9e6fb32b6754792d91b36015e13df9f75d07f9317dd1"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.38/harness_linux_arm64"
      sha256 "f0bc11708aa79ac72e29f6342b2ee17aba91ec339faac99daddd8da8b25f3e64"
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
