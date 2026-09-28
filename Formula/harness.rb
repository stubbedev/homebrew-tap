class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.70"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.70/harness_darwin_amd64"
      sha256 "0268ab0605f79ed7c018ce6d240057562f6cb1f2a7ee8a05a7b2f8564504f506"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.70/harness_darwin_arm64"
      sha256 "3686f780e4b85d124318b79eae7bef02daefcdb02636dac3f9bc83bc69c2700a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.70/harness_linux_amd64"
      sha256 "6cb6e7197e1ce888ab0a9308728cc8484652b8c6e5b74f2f4c78a46a02ed59b5"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.70/harness_linux_arm64"
      sha256 "4f9cf413f6e54e320f55c71104dff8a1c73e2bd807a1fdd57e386d6bd2b7ba8a"
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
