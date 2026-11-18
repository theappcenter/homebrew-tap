cask "dusty" do
  version "2.5.5"
  sha256 "dc6339dc6c28ee2867b5115e56e6de7a4c0e99f54c24c1a25874e4e266261815"

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
