cask "dusty" do
  version "2.5.1"
  sha256 "62a882826ae58977de79bc3b4985f54f448fed1695186e22808f5162d822196e"

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
