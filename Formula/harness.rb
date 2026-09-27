class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.68"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.68/harness_darwin_amd64"
      sha256 "8a8ec2d18350e30ff83bda5e9cb898f60c066a9084caa3a591d72e6cb561156a"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.68/harness_darwin_arm64"
      sha256 "119686b47552c6b828a4a8b609d131188e64c13a41051f8ace877be60f669d84"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.68/harness_linux_amd64"
      sha256 "75380171e05be991c31d8ca539f42116d131f9a00de7cb7231bb5b78804341f0"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.68/harness_linux_arm64"
      sha256 "0c59ba7b7d646c72c514f5924f1417a3efbb053dc82d31cac0dfe562f05ea850"
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
