class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.46"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.46/harness_darwin_amd64"
      sha256 "a679225c621855372a6526f8415bf16cb0639fa232f88f242f5acd7173fddfcc"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.46/harness_darwin_arm64"
      sha256 "b9216de5a1894d058af521c3f820e1febedfb546578275000ffeb3634a6e96e7"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.46/harness_linux_amd64"
      sha256 "5b3fe518e3164e75ddf122f0dd70ace631c4de6232c0ad0ff4b76e25ec4f8178"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.46/harness_linux_arm64"
      sha256 "d9875476d6adc8e90eb3ca0feb8c6b99565cb5807780668d5f15c2435fe89e9e"
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
