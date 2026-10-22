class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.80"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/harness/releases/download/v0.0.80/harness_darwin_arm64"
      sha256 "76a42f7a5ca46af172a0922c1d5ca8b954e7a946a78e6a70ed1fe6c488f84c5a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.80/harness_linux_amd64"
      sha256 "e80c7ce13862e7c84108a25b4a9ea2ed191093f358c31a40651e0e5cd8db7a0f"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.80/harness_linux_arm64"
      sha256 "5240b51f330bc3e18ee06363a502bac88859a6847fa784c70413b6f537f63660"
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
