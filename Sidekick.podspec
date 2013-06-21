Pod::Spec.new do |s|
	s.name = 'Sidekick'
	s.version = '0.0.1'
	s.summary = 'Utility framework of iOS.'
	s.author = { 'Markus Kauppila' => 'markus.kauppila@gmail.com' }
	s.license = { :type => 'MIT', :file => 'License.md' }
	s.homepage = 'https://github.com/mkauppila/Sidekick'
	s.source = { 
		:git => 'https://github.com/mkauppila/Sidekick.git',
		:tag => s.version.to_s 
	}
	s.source_files = 'Sidekick'
	s.frameworks = 'CoreGraphics'
    s.platform = :ios, '5.1'
	s.requires_arc = true
end
