class Maestro < Formula
  desc "Composer, natively: a drop-in replacement for the composer command"
  homepage "https://github.com/stubbedev/maestro"
  version "1.0.17"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/stubbedev/maestro/releases/download/v1.0.17/maestro_darwin_arm64"
    sha256 "e42bec54734d0463bb4f1f078fe4203e8303b245647b86691263cf6458fe1ed8"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.17/maestro_linux_amd64"
      sha256 "861b0a31c78589fc6264eb1c4c942bacff04fe3abe83c29be528ecbf4aa504d7"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.17/maestro_linux_arm64"
      sha256 "aeacc03d769c14ec30565728be3a8e57453b6f0ca3a6b876f9258fd54e047c12"
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
