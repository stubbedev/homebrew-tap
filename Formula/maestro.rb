class Maestro < Formula
  desc "Composer, natively: a drop-in replacement for the composer command"
  homepage "https://github.com/stubbedev/maestro"
  version "1.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.3/maestro_darwin_amd64"
      sha256 "4a0efc793a23c367839ca24684d34f00d4d979c44bc225ce53140c63d65d74f2"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.3/maestro_darwin_arm64"
      sha256 "fc8a53ed713fecca3fe6672c947f8b974c0ecbccfd289b3bfd69fb475e8834af"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.3/maestro_linux_amd64"
      sha256 "7d4748a1ebc02d16056a67212d4f3b0225423abb325e6f6bffe918db12b0891a"
    else
      url "https://github.com/stubbedev/maestro/releases/download/v1.0.3/maestro_linux_arm64"
      sha256 "c824a723f4c984fbed695f9c314117ca9d04f77f58f0e87f9649793f8277461f"
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
