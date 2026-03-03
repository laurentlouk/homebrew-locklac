cask "locklac" do
  version "0.4.0"
  sha256 "dccbca4afd69e4af688b98aa4d3f829270b0dba1f56add2fccc356480545aaf2"

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
