# Nushell Environment Config File

def create_left_prompt [] {
    let dir = ([
        ($env.PWD | str substring 0..($env.HOME | str length) | str replace -s $env.HOME "~"),
        ($env.PWD | str substring ($env.HOME | str length)..)
    ] | str join | path basename)

    if $env.TERM == "linux" {
      $" ($dir) "
    } else {
      $"(ansi bg_green)(ansi xterm_grey7) ($dir) (ansi reset)"
      #$" (ansi cyan_bold)($dir)(ansi reset) "
    }
}

def create_right_prompt [] {
    if $env.TERM == "linux" {
      ""
    }

    let segment_color = $"(ansi light_blue_dimmed)"
    let duration = (((($env.CMD_DURATION_MS | into int) / 1000 | math round | into string) + "sec") | into duration)
    let prompt_list = if $duration >= ("5sec" | into duration) {
      if $env.LAST_EXIT_CODE == 0 {
        [ $duration ]
      } else {
        [ $"(ansi red_bold)✘", $duration ]
      }
    } else {
        []
    }

    [ $segment_color, ($prompt_list | str join $" (ansi xterm_grey30)|($segment_color) "), " " ] | str join
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { || create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = { || create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
if $env.TERM == "linux" {
  let-env PROMPT_INDICATOR = { || $"> " }
} else {
  let-env PROMPT_INDICATOR = { || $"(ansi green_bold) " }
  #let-env PROMPT_INDICATOR = { || $"(ansi black) " }
  #let-env PROMPT_INDICATOR = { || $"(ansi green_bold)❭ " }
  #let-env PROMPT_INDICATOR = { || $"(ansi green)$ " }
  #let-env PROMPT_INDICATOR = { || $"(ansi reset)(ansi green) " }
}
let-env PROMPT_INDICATOR_VI_INSERT = { || ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { || " " }
let-env PROMPT_MULTILINE_INDICATOR = { || "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')

#cat .config/termcolors | sh .local/bin/theme.sh
sh .local/bin/theme.sh monokai-soda

let-env EDITOR = "micro"
