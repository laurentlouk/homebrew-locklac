cask "locklac" do
  version "0.2.0"
  sha256 "33e6f303f97a2e9798ff0bd398f751598788184e4e71f5c5999b382b1af52e32"

  url "https://github.com/laurentlouk/locklac/releases/download/v#{version}/lockLac-#{version}.zip"
  name "lockLac"
  desc "macOS menu bar app that locks your screen while background tasks run"
  homepage "https://github.com/laurentlouk/locklac"

  depends_on macos: ">= :ventura"

  app "lockLac.app"
  binary "#{appdir}/lockLac.app/Contents/MacOS/locklac"

  zap trash: "~/.locklac"
end
