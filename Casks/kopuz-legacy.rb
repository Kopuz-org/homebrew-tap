cask "kopuz-legacy" do
  version "1.0.1"
  sha256 "624160a47e18724f4bc480043e0da2b9c5d86355be593054308b763fd1c57d0c"

  url "https://github.com/Kopuz-org/kopuz/releases/download/v#{version}/Kopuz-Legacy-#{version}-aarch64.dmg"
  name "Kopuz Legacy"
  desc "Legacy interface of the Kopuz music player, with the daemon built in"
  homepage "https://github.com/Kopuz-org/kopuz"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "KopuzLegacy.app"

  caveats do
    <<~EOS
      Kopuz Legacy is signed ad-hoc rather than notarized, so Gatekeeper blocks the
      first launch. Either install with

        brew install --cask --no-quarantine kopuz-org/tap/kopuz-legacy

      or clear the flag once after installing:

        xattr -d com.apple.quarantine "#{appdir}/KopuzLegacy.app"
    EOS
  end
end
