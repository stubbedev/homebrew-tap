class Harness < Formula
  desc "Terminal-based AI coding assistant"
  homepage "https://github.com/stubbedev/harness"
  version "0.0.37"
  license "FSL-1.1-MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.37/harness_darwin_amd64"
      sha256 "aeab792c6189d88f1ae7875d47c70127a5ebaa9253cfc91309ad76f660082405"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.37/harness_darwin_arm64"
      sha256 "f7204bba3c6a7d12935449c1cd029f4cc095a9db28b1d50ef327818388ac4580"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/harness/releases/download/v0.0.37/harness_linux_amd64"
      sha256 "b76cb7889f47c452c14004a2d7e534804182fbd4cb09929ad4664a2db152c400"
    else
      url "https://github.com/stubbedev/harness/releases/download/v0.0.37/harness_linux_arm64"
      sha256 "60b4454d5653ab7197aaee1b0b172471117f05906d3f7c803eea6171bb3c11b9"
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
