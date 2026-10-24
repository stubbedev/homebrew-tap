class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.84"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/harness/releases/download/v0.0.84/harness_darwin_arm64"
      sha256 "c2b2b22a51d12ac144bd78d6fb7438e4332ebb4bbd12cf69b95598eb2243ca3b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.84/harness_linux_amd64"
      sha256 "6c640ca9302428040246f8bdc147f768d58e04c8382cbe399068062e57af0f36"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.84/harness_linux_arm64"
      sha256 "906ac0c1f8d1825e636b9778c0863a4180aebea7f2a9189ab94256d4be8a2996"
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
