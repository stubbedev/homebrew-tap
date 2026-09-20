class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.35"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.35/harness_darwin_amd64"
      sha256 "f4cf455acb2e48ef7a914c0968d60e8460c7c1472662799e27b459d15d2b8598"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.35/harness_darwin_arm64"
      sha256 "5cd006872f0c646114921d0aa4e5cfd47b7279ce3444abbfe8b9d804ed6bf3a0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.35/harness_linux_amd64"
      sha256 "157f9f56a22ccd2d0e121e5043887faaaa5a9f6ed20e740e59b2338b9a0762e8"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.35/harness_linux_arm64"
      sha256 "db3eb27fdbbb355d53e0e9ea2cbce91f636f996a2b4bfa23f9a45715513f082d"
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
