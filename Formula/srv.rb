class Srv < Formula
  desc "Traefik + TLS + DNS edge layer for static, proxy, and container sites"
  homepage "https://github.com/stubbedev/srv"
  version "0.4.35"
  license "MIT"

  depends_on "mkcert"

  on_macos do
    on_arm do
      url "https://github.com/stubbedev/srv/releases/download/v#{version}/srv-#{version}-darwin-arm64.tar.gz"
      sha256 "26c2d95a1945597d1c4d031b2f10ab53eb92813a83e7525ac8ba9e74165f6ee8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/stubbedev/srv/releases/download/v#{version}/srv-#{version}-linux-arm64.tar.gz"
      sha256 "790a85290f09203fa09c39ea4b106b1da55c28ae32ab0c0b3bde3b775e3808e4"
    end
    on_intel do
      url "https://github.com/stubbedev/srv/releases/download/v#{version}/srv-#{version}-linux-amd64.tar.gz"
      sha256 "ecd43e7faa9c4b85d94468cdc48bc120d4c0f7bd2d1c362c3ff37b4f3dbe7a48"
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
