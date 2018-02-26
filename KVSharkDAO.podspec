Pod::Spec.new do |s|

  s.name         = "KVSharkDAO"
  s.version      = "0.0.2"
  s.summary      = "DAO for SharkORM"

  s.description  = <<-DESC
  Libraty implements DAO for SharkORM
                   DESC

  s.homepage     = "https://github.com/leoniknik/KVSharkDAO"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }

  s.author       = { "VolodinK" => "VolodinK@binbank.ru" }

  s.source       = { :git => "https://github.com/leoniknik/KVSharkDAO.git" }

  s.ios.deployment_target = '10.0'

  s.source_files  = "Classes", "Classes/**/*"

  s.requires_arc = true

  s.framework = 'Foundation'
  s.dependency 'SharkORM'

end

# git tag "0.0.1" && git push origin master --tags
