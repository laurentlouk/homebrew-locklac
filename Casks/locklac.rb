cask "locklac" do
  version "0.3.1"
  sha256 "88f5d958a9fc7756c39b9d34e0e297beb8561e57175f286378154775ac11fd39"

  url "https://github.com/laurentlouk/locklac/releases/download/v#{version}/lockLac-#{version}.zip"
  name "lockLac"
  desc "macOS menu bar app that locks your screen while background tasks run"
  homepage "https://github.com/laurentlouk/locklac"

  depends_on macos: ">= :ventura"

  app "lockLac.app"
  binary "#{appdir}/lockLac.app/Contents/MacOS/locklac"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/lockLac.app"],
                   sudo: false
  end

  zap trash: "~/.locklac"
end
