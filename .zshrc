# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    nvm
    fzf
    fzf-tab
    zsh-syntax-highlighting
    zsh-autosuggestions
    web-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH=$PATH:/opt/nvim/bin
export PATH="$PATH:/opt/nvim-linux64/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# PATH

export SHARED_PATH="/mnt/640E7B160E7AE08A"
# export ARM_GCC_PATH="/opt/arm-none-eabi/gcc-arm-none-eabi-10.3-2021.10/bin"
export ARM_GCC_PATH="/usr/bin/arm-none-eabi-gcc"
export CUBE_PATH="$SHARED_PATH/Linux/STM/CubeMX"
export CUBE_PROGRAMMER_PATH="$SHARED_PATH/Linux/STM/Programmer/bin"
export PLATFORMIO_PATH="/home/eduardo-barreto/.platformio/penv/bin"
export SCRIPTS_PATH="/home/eduardo-barreto/scripts"
export LOCAL_BIN_PATH="/home/eduardo-barreto/.local/bin"

export PATH="$PATH:$ARM_GCC_PATH:$CUBE_PROGRAMMER_PATH:$CARGO_PATH:$PLATFORMIO_PATH:$SCRIPTS_PATH:$LOCAL_BIN_PATH"

export VISUAL="nvim"
export EDITOR="nvim"

export RMW_IMPLEMENTATION="rmw_cyclonedds_cpp"
export TURTLEBOT3_MODEL="burger"
export ROS_DOMAIN_ID="44"
export LDS_MODEL="LDS_02"
export ROS_DISTRO="jazzy"

# ALIASES
alias vim='nvim'
alias :q='exit'
alias :Q='exit'
alias install='sudo nala install -y'
alias update='sudo nala upgrade -y && sudo nala autoremove -y && sudo snap refresh'
alias uninstall='sudo nala remove'
alias clean='sudo nala clean && sudo nala autoremove'
alias fix='sudo nala install -f'
alias moo='apt moo'
alias tux='cowsay -f tux'
alias cls='clear'
alias cd..='cd ..'
alias reload='source ~/.zshrc'
alias python='python3'
alias py='python'
alias venv='uv venv env'
alias activate='source ./*env/bin/activate'
alias cpwd='pwd && pwd | xclip -selection clipboard'
alias copy='xclip -selection clipboard'
alias ccat='pygmentize -g -O linenos=1'
alias submodule='git submodule update --init --recursive'
alias programmer_cube='$CUBE_PROGRAMMER_PATH/STM32CubeProgrammer'
alias remake='make clean_cube && make clean_all && cd .. && rm -rf build && mkdir build && cd build && cmake ..'
alias old_remake='make clean_all clean_cube clean cube prepare; make -j'
alias thunder='cd ~/ThunderProjetos/'
alias ls='eza'
alias ll='eza -alh'
alias bat='batcat'
alias fzfc='fzf | xclip -selection clipboard'
alias term='nvim ~/.zshrc'
alias cnvim='nvim ~/.config/nvim'
alias ckitty='nvim ~/.config/kitty'
alias va='nvim a.md'
alias s='search'
alias coin='toss-a-coin'
alias lg='lazygit'
alias ros='source /opt/ros/jazzy/setup.zsh'
alias req='pip install -r requirements.txt'
alias gmoji='gitmoji -s'
alias godot='/home/eduardo-barreto/Apps/Godot_v4.3-stable_linux.x86_64 & disown; exit'
alias pip='uv pip'


# Funções
function layers() {
    alias rid='cd ~/Layers/layers-core-id && nvm use && yarn start'
    alias rcw='cd ~/Layers/layers-core-app-web && nvm use && yarn start'
    alias rcb='cd ~/Layers/layers-core-backend && docker-compose up -d && nvm use && yarn start'
    alias rfreqf='cd ~/Layers/layers-frequencia/server/functions && nvm use && yarn serve'
    alias rfreqw='cd ~/Layers/layers-frequencia/web && nvm use && yarn start'

    alias lcore='cd ~/Layers/ && zsh ~/.config/kitty/workflows/layers_core.sh'
    alias lfreq='cd ~/Layers/ && zsh ~/.config/kitty/workflows/layers_frequencia.sh'

    function lhelp() {
        echo 'rid -> Run Layers Core ID'
        echo 'rcw -> Run Layers Core App Web'
        echo 'rcb -> Run Layers Core Backend'
        echo 'rfreq -> Run Layers Frequência'
        echo ''
        echo 'lcore -> Launch layers-core applications'
        echo 'lfreq -> Launch layers-frequencia applications'
    }

    lhelp
    cd ~/Layers
}

# Configura atalhos para executar scripts Python no diretório $HOME/scripts
for file in $SCRIPTS_PATH/*.py; do
    name=$(basename "$file" .py)
    alias $name="$SCRIPTS_PATH/env/bin/python3 \"$file\""
done

# Configura atalhos para executar workflows do kitty
for file in $HOME/.config/kitty/workflows/*.sh; do
    name=$(basename "$file" .sh)
    alias $name="source \"$file\""
done

# Função para compilar e executar C
function compile_c() {
    name=$(ls *.c | head -n 1 | cut -d'.' -f1)
    mkdir -p out
    gcc "$name.c" -o "out/$name.o" -lm
    ./out/$name.o
}

# Função para criar diretório e navegar até ele
function take() {
    mkdir -p "$1"
    cd "$1"
}

# Função para clonar repositório e navegar até ele
function clone() {
    git clone "$1"
    cd "$(basename "$1" .git)"
}

# Função para abrir o STM32CubeMX
function cube() {
    if [ -z "$CUBE_PATH" ]; then
        echo "Erro: A variável de ambiente CUBE_PATH não está definida. Configure-a antes de usar o CubeMX."
        return 1
    fi

    project_path=""
    verbose_mode=false
    open_empty=false

    function find_ioc() {
        search_dirs="./cube $(realpath ..)/cube"
        for dir in $search_dirs; do
            project_path=$(find "$dir" -maxdepth 1 -name "*.ioc" -type f 2>/dev/null | sort -V | tail -n 1)
            if [ -n "$project_path" ]; then
                echo "$project_path"
                return 0
            fi
        done
        return 1
    }

    function show_help() {
        echo "Uso: cube [-v|--verbose] [-e|--empty] [caminho_do_projeto]"
        echo "  -v, --verbose  Ativa o modo verbose, exibindo mensagens detalhadas."
        echo "  -e, --empty    Abre o STM32CubeMX sem um projeto, caso nenhum caminho seja fornecido."
        echo "  caminho_do_projeto Caminho para o arquivo .ioc do projeto STM32CubeMX."
        echo "                    Se não fornecido e a flag -e não estiver presente, tentará encontrar automaticamente."
    }


    for arg in "$@"; do
        case $arg in
            -v|--verbose)
                verbose_mode=true
                ;;
            -e|--empty)
                open_empty=true
                ;;
            -h|--help)
                show_help
                return
                ;;
            *)
                project_path=$arg
                ;;
        esac
    done

    if [ ! -f "$project_path" ]; then
        project_path=$(find_ioc)
    fi

    if [ "$verbose_mode" = true ]; then
        if [ "$open_empty" = true ] || [ -z "$project_path" ]; then
            echo "Modo verbose ativado. Abrindo o STM32CubeMX vazio."
            "$CUBE_PATH/STM32CubeMX"
        else
            echo "Modo verbose ativado. Abrindo o STM32CubeMX com o arquivo .ioc: $project_path"
            "$CUBE_PATH/STM32CubeMX" "$project_path"
        fi
    else
        if [ "$open_empty" = true ] || [ -z "$project_path" ]; then
            echo "Abrindo STM32CubeMX vazio."
            "$CUBE_PATH/STM32CubeMX" >/dev/null 2>&1 &
            if [ "$verbose_mode" = false ]; then
                disown %1
            fi
        else
            echo "Abrindo o STM32CubeMX com o arquivo .ioc: $project_path"
            "$CUBE_PATH/STM32CubeMX" "$project_path" >/dev/null 2>&1 &
            disown %1
        fi
    fi
}

# Função para abrir repositório remoto na branch atual
function open_remote() {
    origin_url=$(git remote get-url origin)
    repo_url=$(echo "$origin_url" | grep -o 'github\.com[:/].*\.git' | sed 's/github\.com[:/]\(.*\)\.git/\1/')
    branch_name=$(git symbolic-ref --short HEAD)

    if [ -n "$repo_url" ] && [ -n "$branch_name" ]; then
        url="https://github.com/$repo_url/tree/$branch_name"
        echo "Abrindo repositório remoto na branch atual no navegador: $url"
        open "$url"
    else
        echo "Não foi possível determinar o link remoto ou a branch atual."
    fi
}

# Função para gerar link do Seafile
function seafile_link() {
    base_url="https://drive.thunderatz.org/lib/347d7784-96f3-4b88-ada2-34acec0262f2/file/"
    file_path="$1"
    file_path=$(echo "$file_path" | sed 's/ /%20/g')
    echo "$base_url$file_path"
}

# Função para selecionar arquivo usando fzf e gerar link do Seafile
function seafile_fzf() {
    open_in_browser=false

    for arg in "$@"; do
        case $arg in
            -o|--open)
                open_in_browser=true
                ;;
            *)
                echo "Opção desconhecida: $arg"
                return 1
                ;;
        esac
    done

    selected_path=$(fzf)

    if [ -n "$selected_path" ]; then
        quoted_path=$(echo "$selected_path" | tr -d "'")
        seafile_link=$(seafile_link "$quoted_path")
        echo "$seafile_link"

        if [ "$open_in_browser" = true ]; then
            open "$seafile_link"
        fi
    else
        echo "Nenhum arquivo selecionado."
    fi
}

# Função para lançar comandos em background
function launch() {
    nohup "$@" &>/dev/null & disown
}

webm_mp4() {
    if [ $# -eq 0 ]; then
        echo "Uso: webm_mp4 <arquivo.webm>"
        return 1
    fi

    for file in "$@"; do
        if [[ $file == *.webm ]]; then
            output="${file%.webm}.mp4"
            ffmpeg -i "$file" -c:v libx264 -c:a aac "$output"
            echo "Convertido: $file -> $output"
        else
            echo "O arquivo $file não é um .webm"
        fi
    done
}

cvt_last() {
    dir="/home/eduardo-barreto/Videos/Screencasts"

    last_webm=$(ls -t "$dir"/*.webm 2>/dev/null | head -n 1)

    if [ -z "$last_webm" ]; then
        echo "Nenhum arquivo .webm encontrado no diretório $dir"
        return 1
    fi

    webm_mp4 "$last_webm"
}

eval "$(zoxide init zsh)"
eval "$(register-python-argcomplete ros2)"
eval "$(register-python-argcomplete colcon)"

