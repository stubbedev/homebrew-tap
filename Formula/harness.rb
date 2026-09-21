class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.41"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.41/harness_darwin_amd64"
      sha256 "49b883149ededb285699f05ca7d1bb958c24681b12ec66441c7ddf96929cf2ed"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.41/harness_darwin_arm64"
      sha256 "d7a174e2ffd519c20b73bf104fa55522e67c2779ce5ea5e7e294ebc78b4add35"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.41/harness_linux_amd64"
      sha256 "4c197ab1c9917a379deca20aed8fb85087d7d0632dfe61e3c7052850664d962a"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.41/harness_linux_arm64"
      sha256 "c411416e5230e8d60b0b88b54d93f2b31c35aedde956314a81672fff224a6c3c"
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
