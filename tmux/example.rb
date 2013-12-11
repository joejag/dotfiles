require '~/.dotfiles/tmux/tmux_mananger.rb'

# Open a hacking term and vim at the default_dir
tmuxinate(name: 'blog', default_dir: '/Users/joe/dev/projects/www') do
  # open a third terminal with grunt running
  fire cmd: 'grunt watch'
end
