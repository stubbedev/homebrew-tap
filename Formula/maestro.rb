class Maestro < Formula
  desc "Composer, natively: a drop-in replacement for the composer command"
  homepage "https://github.com/stubbedev/maestro"
  version "1.0.16"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/stubbedev/maestro/releases/download/v1.0.16/maestro_darwin_arm64"
    sha256 "a7b3550934f0f16fd685bdad6ab419cd6cb0bfe5a7649e24aed2a9644378e764"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.16/maestro_linux_amd64"
      sha256 "788a8f99b0d06825e2c84096188dd51d8033b9a74e274e33ed070365da6b5f17"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.16/maestro_linux_arm64"
      sha256 "8bc6028479e93b7dbe812bb7a5a6ee337e6a1e4c2cb9420eabe9330def986c04"
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
