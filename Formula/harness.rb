class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.74"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.74/harness_darwin_amd64"
      sha256 "e6e1916378f9d2d62ebcb0e6b1805cfa02525ecac11adc13367b4cfd22343fbe"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.74/harness_darwin_arm64"
      sha256 "88a6947e83658a97bf3b1e1041ac2e508bb179fa6567c38eb647df69617704b1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.74/harness_linux_amd64"
      sha256 "fbf035a4649f61dcd8b0cea46ea7dfe78a449f83974bf69103561769c31aca2f"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.74/harness_linux_arm64"
      sha256 "b8e27a113a812ca0c929295332169139375545df0318cfb2713ca233d0ea411f"
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
