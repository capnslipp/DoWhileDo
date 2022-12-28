Pod::Spec.new do |s|
  s.name = 'DoWhileDo'
  s.version = ->{
    Dir.chdir(__dir__) do
      semver_regex = /\d+\.\d+\.\d+(?:-[\w\.]+)?(?:\+[\w\.]+)?/
      return `xcodebuild -showBuildSettings 2>/dev/null`.match(/CURRENT_PROJECT_VERSION = (#{semver_regex})/)[1]
    end
  }.call
  s.swift_versions = ['5.0']
  s.authors = { 'capnslipp' => 'DoWhileDo@capnslipp.com' }
  s.social_media_url = 'https://twitter.com/capnslipp'
  s.license = { :type => 'Public Domain', :file => 'LICENSE' }
  s.homepage = 'https://github.com/capnslipp/DoWhileDo'
  s.source = { :git => 'https://github.com/capnslipp/DoWhileDo.git', :tag => "podspec/#{s.version}" }
  s.summary = "A Swift µ-Library Providing do-while-do & do-until-do Loops"
  s.description = "DoWhileDo is a Swift micro-library that provides do-while-do and do-until-do loops."
  
  # File Patterns
  s.source_files = 'Sources/**/*'
end
