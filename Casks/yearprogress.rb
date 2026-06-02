cask "yearprogress" do
  version "1.0.0"
  sha256 "b91b44e18c5524f99a72de5046efe7cd1cc3c338b84550397031724420074e62"

  url "https://github.com/ChoMnSeong/YearProgress/releases/download/v#{version}/YearProgress.zip"
  name "YearProgress"
  desc "Menu bar and widget app showing year, month, week, day and life progress"
  homepage "https://github.com/ChoMnSeong/YearProgress"

  app "YearProgress.app"

  # 공증 미적용 개인 빌드라 설치 후 격리 속성을 제거해 바로 실행되게 합니다.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/YearProgress.app"]
  end

  uninstall quit: "com.ensnif.YearProgress"

  zap trash: [
    "~/Library/Containers/com.ensnif.YearProgress.YearProgressWidget",
    "~/Library/Group Containers/group.com.ensnif.YearProgress",
    "~/Library/Preferences/com.ensnif.YearProgress.plist",
  ]
end
