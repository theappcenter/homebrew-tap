cask "dusty" do
  version "2.5.1"
  sha256 "05397bd312cae0fd0d90f33f1820b0e14b19a7877a7670a24b79ec3f15dde873"

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
