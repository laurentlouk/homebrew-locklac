cask "locklac" do
  version "0.3.0"
  sha256 "25ad6cf00e1d9471361011ce16fb6a8409f20fed458d80825ca8a8f3596f7141"

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

