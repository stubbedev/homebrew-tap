class Maestro < Formula
  desc "Composer, natively: a drop-in replacement for the composer command"
  homepage "https://github.com/stubbedev/maestro"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.0/maestro_darwin_amd64"
      sha256 "5b4e0cd53ce91cdf2181427b02d4ab26c2797ef2b5ab31a6033537e442aa31dd"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.0/maestro_darwin_arm64"
      sha256 "1d8d5b7b0e46d6e759ffa7d47a853d003ba19748db45ef11477d63e08cbc850a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.0/maestro_linux_amd64"
      sha256 "e9fa02e46ae2a138dbf53e8f44ffb5235a82ee0f63cfaee757225191348ddb57"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.0/maestro_linux_arm64"
      sha256 "d63d91e3a0335057755b5383b61c685f632328f7cb804a0f3e0f335dd70d255f"
    end
  end

  depends_on "php"

  def install
    bin.install asset => "maestro"
    chmod 0555, bin/"maestro"
  end

  def caveats
    <<~EOS
      To use maestro as composer:
        ln -s "#{opt_bin}/maestro" "$(brew --prefix)/bin/composer"
    EOS
  end

  def test
    assert_match "maestro version #{version}", shell_output("#{bin}/maestro --version 2>&1")
  end

  def asset
    os = OS.mac? ? "darwin" : "linux"
    arch = Hardware::CPU.intel? ? "amd64" : "arm64"
    "maestro_#{os}_#{arch}"
  end
end
