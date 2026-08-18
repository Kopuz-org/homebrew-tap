cask "kopuz" do
  version "0.15.0"
  sha256 "96cd12839d92282e52e6171860be9e3a2f7e6ae043b7f49451c29a72a926227b"

  url "https://github.com/Kopuz-org/kopuz/releases/download/v#{version}/Kopuz_#{version}_aarch64.dmg",
      verified: "github.com/Kopuz-org/kopuz/"
  name "Kopuz"
  desc "Music player for local libraries, Jellyfin and Subsonic servers"
  homepage "https://github.com/Kopuz-org/kopuz"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "Kopuz.app"

  zap trash: [
    "~/Library/Application Support/com.temidaradev.kopuz",
    "~/Library/Caches/com.temidaradev.kopuz",
    "~/Library/Preferences/com.temidaradev.kopuz.plist",
    "~/Library/Saved Application State/com.temidaradev.kopuz.savedState",
  ]

  caveats do
    <<~EOS
      Kopuz is signed ad-hoc rather than notarized, so Gatekeeper blocks the first
      launch. Either install with

        brew install --cask --no-quarantine kopuz-org/tap/kopuz

      or clear the flag once after installing:

        xattr -d com.apple.quarantine "#{appdir}/Kopuz.app"
    EOS
  end
end
