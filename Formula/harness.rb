class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.55"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.55/harness_darwin_amd64"
      sha256 "e09a3a974edbfea823cd2f033a317426dfa6df819bf9b561a8bb2f3f74827072"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.55/harness_darwin_arm64"
      sha256 "d93366d3fd42f5adef8d9088f79092bb63dbd7a3f812dd076e4a9c7c13a5fb49"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.55/harness_linux_amd64"
      sha256 "5fecaf6aeda5895202b5b46d296b1d7d0f8fac18f622b5484330f6aee53169c8"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.55/harness_linux_arm64"
      sha256 "bba2fd8cd04325b811ddeaba2b0e57afc93c5d6ae77d09a80f36404672965e30"
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
