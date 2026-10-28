class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.87"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/harness/releases/download/v0.0.87/harness_darwin_arm64"
      sha256 "cdf09eff97426ac8e57d893af57f88398ffd55300b2e522621e11308c1fd7cd0"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.87/harness_linux_amd64"
      sha256 "aab8ce4c4c2d1ac6d772f6374174603000dc9a3ed055c5f6e779ea6213170d08"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.87/harness_linux_arm64"
      sha256 "82b418ecbb7fe9107fba8ab8200c4a09232920c9a33130fe5fa0a8c1b75c558e"
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
