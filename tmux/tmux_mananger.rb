# LOW LEVEL

@current_window_number = 1

def start_session(dir, called)
  `tmux new-session -d -s #{@session_name} -n '#{called}'`
  basic_setup(dir)
end

def new_paned_window(called)
  `tmux new-window -t #{@session_name}:#{@current_window_number += 1} -n '#{called}'`
  split_into_four_panes
end

def new_window(dir, called)
  `tmux new-window -t #{@session_name}:#{@current_window_number += 1} -n '#{called}'`
  basic_setup(dir)
end

def new_window_with_cmd(dir, called, cmd)
  new_window(dir, called)
  send_keys(cmd)
end

def basic_setup(dir)
  send_keys('bash')
  send_keys("cd #{dir}")
  send_keys("clear")
end

def send_keys(cmd)
  `tmux send-keys -t #{@session_name}:#{@current_window_number} "#{cmd}" C-m`
end

def split_into_four_panes
  `tmux split-window`
  `tmux select-pane -U`
  `tmux split-window -h`
  `tmux select-pane -D`
  `tmux split-window -h`
end

def launch_in_panes(cmd_one, cmd_two, cmd_three, cmd_four)
  `tmux select-pane -U`
  `tmux select-pane -L`
  basic_setup('~')
  send_keys(cmd_one)

  `tmux select-pane -R`
  basic_setup('~')
  send_keys(cmd_two)

  `tmux select-pane -D`
  basic_setup('~')
  send_keys(cmd_four)

  `tmux select-pane -L`
  basic_setup('~')
  send_keys(cmd_three)
end

def select_first_window
  `tmux select-window -t #{@session_name}:1`
end

def attach_session
  `tmux -2 attach-session -t #{@session_name}`
end

# HIGH LEVEL

def fire(options={})
  raise 'I need a command or a name' if options[:name].nil? and options[:cmd].nil?

  options[:cmd] = '' if options[:cmd].nil?
  options[:dir] = @default_dir if options[:dir].nil?
  options[:name] = options[:cmd].split.first if options[:name].nil?

  new_window_with_cmd(options[:dir], options[:name], options[:cmd])
end

def burst(options)
  new_paned_window(options[:name])
  launch_in_panes(options[:up_left], options[:up_right],  options[:down_left], options[:down_right])
end

def tmuxinate(options)
  @default_dir = options[:default_dir]
  @session_name = options[:name]
  start_session(@default_dir, 'hacking')
  fire cmd: "mvim -v #{@default_dir}", name: 'vim'

  yield

  select_first_window
  attach_session
end
