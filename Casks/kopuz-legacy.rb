cask "kopuz-legacy" do
  version "1.0.0"
  sha256 "1cd2f6fc9e8cd1c22929254508a3be4a806d8b7a6c174fe5774b5e3c04a2042a"

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
