Pod::Spec.new do |spec|

  spec.name         = "iDriveLibrary"
  spec.version      = "1.0.0"
  spec.summary      = "Library to download and cache resources from network"
  spec.description  = "iDriveLibrary is the sample code for downloading and caching of different kinds of data from server"
  spec.homepage     = "http://EXAMPLE/iDriveLibrary"
  spec.license      = "MIT"
  spec.author             = { "rounakskiran" => "rounakskiran@gmail.com" }
  spec.platform     = :ios, "12.0"
  spec.source       = { :git => "https://github.com/rounakskiran/iDriveLibrary.git", :tag => "1.0.0" }
  spec.source_files  = "iDriveLibrary"
  spec.swift_version = "5"

end
