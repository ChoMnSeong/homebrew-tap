cask "halo" do
  version "1.0.2"
  sha256 "3a8d8f441d3713fe69246687ce702986b201b51ea0aacc18cedcb57f163fea0c"

  url "https://github.com/ChoMnSeong/Halo/releases/download/v#{version}/Halo.zip"
  name "Halo"
  desc "macOS notch utility — shelf, timer, calls, notifications, bluetooth, favorites"
  homepage "https://github.com/ChoMnSeong/Halo"

  app "Halo.app"

  # 공증 미적용 개인 빌드라 설치 후 격리 속성을 제거해 바로 실행되게 합니다.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Halo.app"]
  end

  uninstall quit: "com.ensnif.DynamicLake"

  zap trash: [
    "~/Library/Application Support/DynamicLake",
    "~/Library/Preferences/com.ensnif.DynamicLake.plist",
  ]
end
