cask "dusty" do
  version "2.5.0"
  sha256 "3fd3bdfe79b8a491e9516b11989a167fd977e691381261e517cfc636eaa49338"

  url "https://github.com/theappcenter/homebrew-tap/releases/download/v#{version}/Dusty.zip"
  name "Dusty"
  desc "AI-explained macOS storage cleaner and 1-click app uninstaller"
  homepage "https://dustystorage.com"

  auto_updates true
  depends_on macos: :sonoma

  app "Dusty.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Dusty.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Caches/com.dusty.storagecleaner",
    "~/Library/Preferences/com.dusty.storagecleaner.plist",
    "~/Library/HTTPStorages/com.dusty.storagecleaner",
  ]
end
