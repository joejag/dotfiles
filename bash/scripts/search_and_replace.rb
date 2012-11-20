puts `find . -type f | xargs perl -pi -e "s/#{ARGV[0]}/#{ARGV[1]}/g"`
