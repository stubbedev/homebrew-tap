class Maestro < Formula
  desc "Composer, natively: a drop-in replacement for the composer command"
  homepage "https://github.com/stubbedev/maestro"
  version "1.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.6/maestro_darwin_amd64"
      sha256 "4668cbbf9cde4eaaf7c98486daefc79507b379faa04afdd63a86de0e5c217e0f"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.6/maestro_darwin_arm64"
      sha256 "94bd7b63abd13713b3d72605ff8c87436e703a3d634b3f53a57eb3f4ef8de404"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.6/maestro_linux_amd64"
      sha256 "89c3c2a5417717d005c9b808e89226e945fa105b1202f0563440fe68764ada5a"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.6/maestro_linux_arm64"
      sha256 "f5d0d522ed4a0d35e6676a1139c1ee32f4f45e524caa758e88690f376a0d5a68"
    end
  end

  # maestro runs PHP code (platform detection, plugins, scripts) with the
  # php first on PATH, whichever installed it, so Homebrew's php is only
  # an option: forcing it builds php's whole tree where no bottle fits
  # (an Intel brew on Apple Silicon) for users who already have a php.
  depends_on "php" => :optional

  def install
    bin.install asset => "maestro"
    chmod 0555, bin/"maestro"
  end

  def caveats
    <<~EOS
      maestro runs PHP code with the php first on your PATH. If you have
      none, install one (`brew install php`, or reinstall maestro with
      `--with-php`).

      To use maestro as composer:
        ln -s "#{opt_bin}/maestro" "$(brew --prefix)/bin/composer"
    EOS
  end

  def test
    assert_match "Maestro version #{version}", shell_output("#{bin}/maestro --version 2>&1")
  end

  def asset
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"
    "maestro_#{os}_#{arch}"
  end
end
