#
#  Be sure to run `pod spec lint RepeatPhrases_Loading.podspec' to ensure this is a

Pod::Spec.new do |spec|
  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.name         = "RepeatPhrases_Loading"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of RepeatPhrases_Loading."
  spec.homepage     = "https://github.com/gulyaboyko/RepeatPhrases_Loading"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.license      = "MIT"

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
 
  spec.author             = { "Gulya Akhtyamova" => "gulya.nadym@gmail.com" }
  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  spec.platform     = :ios
  spec.ios.deployment_target = '11.0'

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  spec.source       = { :git => "https://github.com/gulyaboyko/RepeatPhrases_Loading.git", :tag => "0.0.1" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source_files = "RepeatPhrases_Loading/**/*.{swift,h,m}"

  spec.swift_version = "5.0"
  spec.static_framework = true

  spec.dependency 'Realm'
  spec.dependency 'RealmSwift'
  spec.dependency 'Firebase'
  spec.dependency 'Firebase/Core'
  spec.dependency 'Firebase/Firestore'
  spec.dependency 'FirebaseFirestoreSwift'
end
