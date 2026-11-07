class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.91"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/harness/releases/download/v0.0.91/harness_darwin_arm64"
      sha256 "07b5d563feb4e948fd7d8c7d89191bfe7c545419efecc77898e15db27eb10a0c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.91/harness_linux_amd64"
      sha256 "fcc276c758dc8a261e708cb8bd5cf67d3e2a07ea0b304ac762a2b7b41e9a46e2"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.91/harness_linux_arm64"
      sha256 "e42495cc2b245a642055489cc644a5787a3c30a72d120f31c79c15e11323f227"
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
