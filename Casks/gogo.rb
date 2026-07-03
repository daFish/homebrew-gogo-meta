cask "gogo" do
  arch arm: "arm64", intel: "amd64"

  version "3.0.0"
  sha256 arm:   "38e873571550869e0df24becbabc62c1a92bd2792780483d7ebe6a2f5a411475",
         intel: "28c2bbc5f3242accab545d12e6936f3c00fecfb54c96aceec07c9a6930fb6fdd"

  url "https://github.com/daFish/gogo-meta/releases/download/v#{version}/gogo_#{version}_darwin_#{arch}.tar.gz"
  name "gogo"
  name "gogo-meta"
  desc "Run commands across multiple Git repositories at once"
  homepage "https://github.com/daFish/gogo-meta"

  livecheck do
    url :url
    strategy :github_latest
  end

  binary "gogo"

  # The released binaries are ad-hoc signed but not notarized, so macOS
  # Gatekeeper terminates them on first run. Strip the quarantine flag.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/gogo"]
  end
end
