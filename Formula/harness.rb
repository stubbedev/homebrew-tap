class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.90"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/harness/releases/download/v0.0.90/harness_darwin_arm64"
      sha256 "978e392b2ee8e5c9b3e3990a782f6a4df28233fc6a5417474dba200a3d0838cb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.90/harness_linux_amd64"
      sha256 "920f355dfe923386d59166e7d684cee169674d8d582bf54ea010268239342484"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.90/harness_linux_arm64"
      sha256 "5d74435ddcf58febf25a769aa59da3d6c8d0ff1dd0421d8c2edc9e5c5599c951"
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
