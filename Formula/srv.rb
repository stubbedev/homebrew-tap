class Srv < Formula
  desc "Traefik + TLS + DNS edge layer for static, proxy, and container sites"
  homepage "https://github.com/stubbedev/srv"
  version "0.5.0"
  license "MIT"

  depends_on "mkcert"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/srv/releases/download/v#{version}/srv-#{version}-darwin-arm64.tar.gz"
      sha256 "554aa3b0b877eaf0b8a9faa036a322ca918f8a9bb40a48e939945245330a4050"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/srv/releases/download/v#{version}/srv-#{version}-linux-arm64.tar.gz"
      sha256 "73a4e3efc7a1655ae1df42a1f8c35fe6b4f78c18ba67915b976514551bb78daf"
    end
    on_intel do
      url "https://github.com/stubbedev/srv/releases/download/v#{version}/srv-#{version}-linux-amd64.tar.gz"
      sha256 "6ba8e3994b729aba84496eee4ae486e687b521b27ce73e9865e97120e5d4388c"
    end
  end

  def install
    bin.install "srv"
  end

  # Lets users run `brew services start srv` instead of the
  # unit `srv install` writes. srv detects this unit: with it
  # installed, `srv install` and `srv daemon install` do not
  # add a second one, and `srv daemon start|stop|status` drive it.
  service do
    run [opt_bin/"srv", "daemon", "start", "--foreground"]
    # KeepAlive only on unexpected exits — `brew services stop`
    # and `srv daemon stop` (clean exit 0) leave the daemon
    # down. Mirrors the plist `srv daemon install` writes so
    # behaviour matches across install paths.
    keep_alive successful_exit: false
    process_type :background
    log_path var/"log/srv.log"
    error_log_path var/"log/srv.log"
  end

  def caveats
    <<~CAVEATS
      srv needs a container runtime (Docker, Podman, Colima,
      OrbStack or Rancher Desktop) with Compose v2.

      First-time setup (Traefik, DNS, local CA, daemon service):
        srv install

      srv install also installs the daemon as a login service. To
      have Homebrew supervise it instead, run this first; srv then
      leaves the daemon to brew:
        brew services start srv
    CAVEATS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/srv version")
  end
end
