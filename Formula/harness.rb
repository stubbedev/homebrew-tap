class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.25"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.25/harness_darwin_amd64"
      sha256 "8d02eb403329009dded2f7295163041439d85973a04134134b7c8ee76aca2956"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.25/harness_darwin_arm64"
      sha256 "b5731f74719b54880d94ea97f290f377250582cbdf8843a1ddc6caffd97f53a4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.25/harness_linux_amd64"
      sha256 "054717a74763e39a8ef0c3467a4baf03f9975a81a4446afd395a0dd258ceca0c"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.25/harness_linux_arm64"
      sha256 "13b1865dac7ecf433949782d6c2c4ae78c6886cd2714d089cfc4afb4a503429b"
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
