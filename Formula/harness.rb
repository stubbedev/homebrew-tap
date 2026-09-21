class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.36"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.36/harness_darwin_amd64"
      sha256 "26cbec565bb961f4f145f2621153a330133d72251ef2a6791c1f4e8013756e2d"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.36/harness_darwin_arm64"
      sha256 "524ad4425a23a8c25e5c2a0765895c47170c89a729a2edc18d14d5d06d439e1a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.36/harness_linux_amd64"
      sha256 "f379fe9e83cab2ca4997b52f979f0915a95f981fc6f69b2cfe3de26ff092800e"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.36/harness_linux_arm64"
      sha256 "6ebd904270299ad40984841deee654d76902972b9ac4870ce2295ae185ce6211"
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
