Pod::Spec.new do |s|
	s.name = 'Sidekick'
	s.version = '0.1'
	s.summary = 'TBA.'
	s.author = { 'Markus Kauppila' => 'markus.kauppila@gmail.com' }
	s.license = 'MIT'
	s.homepage = 'http://something-on-github'
	s.source = { 
		:git => 'file:///Users/markus/Xcode/Sidekick',
		:tag => '0.1' 
	}
	s.source_files = 'Sidekick'
	s.frameworks = 'CoreGraphics'
    s.platform = :ios, '5.1'
	s.requires_arc = true
end
