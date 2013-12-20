require "rubygems"

# Usage: NOT to be used manually
desc 'Publish site from Travis CI to GitHub Pages'
task :travis do
  system "git config user.name '#{ENV['GIT_NAME']}'"
  system "git config user.email '#{ENV['GIT_EMAIL']}'"
  system 'git config credential.helper "store --file=.git/credentials"'
  File.open('.git/credentials', 'w') do |f|
    f.write("https://#{ENV['GH_TOKEN']}:@github.com")
  end
  system "git clone https://github.com/urho3d/urho3d.github.io.git doc-Build"
  system "ruby -lne 'BEGIN { credits = false }; puts $_ if credits; credits = true if /bugfixes by:/; credits = false if /^$/' Readme.txt |ruby -i -le 'BEGIN { credits = STDIN.read }; puts ARGF.read.gsub(/(?<=bugfixes by\n).*?(?=##)/m, credits)' doc-Build/about.md"
  system "rm -rf doc-Build/documentation"
  system "cp -r Docs/html doc-Build/documentation"
  system "cd doc-Build && git add -A && git commit -q -a -m 'Travis CI automated site deploy at #{Time.now.utc}.' && git push -q"
  File.delete '.git/credentials'
end
