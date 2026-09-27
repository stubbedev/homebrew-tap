class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.64"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.64/harness_darwin_amd64"
      sha256 "464af944e3cacdfa731cafef922c6b38880f6213965364b43d55ec223b63160c"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.64/harness_darwin_arm64"
      sha256 "219f396edb82f2673fa33239dd9fa2bb95f2b940f6beda6469e6f8f02d7503f1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.64/harness_linux_amd64"
      sha256 "999e8e0825ce138872e9ad21f4c3552ac9a8179831dbb2bf7b07e8f2dca33ec3"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.64/harness_linux_arm64"
      sha256 "6bdeaa546b8f00db6250908e5fafc46641abaf8cf496fbfc64c3565633092c86"
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
