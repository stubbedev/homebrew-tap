class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.92"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/harness/releases/download/v0.0.92/harness_darwin_arm64"
      sha256 "208ca7bc4ee2f6d2c05be6fb1041d2e92232276c4c0909f776cbfd492f937972"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.92/harness_linux_amd64"
      sha256 "05769660f25512e5d42f518e382a60d9ef121aecd86c120061680e1c76015f1d"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.92/harness_linux_arm64"
      sha256 "ee163725aec46cb49f52af3a10e252914f50a43d4a32aefa7f898f5bf13a3d1b"
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
