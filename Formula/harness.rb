class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.88"
  license "FSL-1.1-MIT"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/harness/releases/download/v0.0.88/harness_darwin_arm64"
      sha256 "580006405e11f5ba5e1df4c2d7e20a571ce08792092f41a7bc931ff05049ce00"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.88/harness_linux_amd64"
      sha256 "373536258b0a5463ee4ba8a3fe75429235c2d2ebac148748009486140d5a6130"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.88/harness_linux_arm64"
      sha256 "290b52f11deecd019eaca0053a3bcde654038b8902e249d9022b7932351daa0d"
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
