# Inicializa o Starship
starship init fish | source

# Configuração de variáveis de ambiente
set -x ARM_GCC_PATH /opt/arm-none-eabi/gcc-arm-none-eabi-10.3-2021.10/bin
set -x CUBE_PATH /media/eduardo-barreto/Shared/Linux/STM/CubeMX
set -x CUBE_PROGRAMMER_PATH /media/eduardo-barreto/Shared/Linux/STM/Programmer/bin

set -x CARGO_PATH /home/eduardo-barreto/.cargo/bin

set -x PLATFORMIO_PATH /home/eduardo-barreto/.platformio/penv/bin

set -x SCRIPTS_PATH /home/eduardo-barreto/scripts

# Adiciona diretórios ao PATH
set -x PATH $PATH $ARM_GCC_PATH
set -x PATH $PATH $CUBE_PROGRAMMER_PATH
set -x PATH $PATH $CARGO_PATH
set -x PATH $PATH $PLATFORMIO_PATH
set -x PATH $PATH $SCRIPTS_PATH

# Configura o editor padrão
set -x VISUAL /usr/bin/gedit
set -x EDITOR /usr/bin/gedit

# set -x TERM screen-256color
# Atalhos (abreviações) úteis
abbr nvim 'nvim ./'
abbr :q exit
abbr :Q exit
abbr install 'sudo apt install -y'
abbr update 'sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y && sudo snap refresh'
abbr uninstall 'sudo apt remove'
abbr clean 'sudo apt autoclean && sudo apt autoremove'
abbr fix 'sudo apt install -f'
abbr moo 'apt moo'
abbr tux 'cowsay -f tux'
abbr cls clear
abbr cd.. 'cd ..'
abbr reload 'source ~/.config/fish/config.fish'
abbr python python3
abbr py python
abbr term 'nvim ~/.config/fish/config.fish'
abbr venv 'python3 -m venv env'
abbr activate 'source ./*env/bin/activate.fish'
abbr cpwd 'pwd && pwd | xclip -selection clipboard'
abbr copy 'xclip -selection clipboard'
abbr ccat 'pygmentize -g -O linenos=1'
abbr submodule 'git submodule update --init --recursive'
abbr programmer_cube '$CUBE_PROGRAMMER_PATH/STM32CubeProgrammer'
abbr remake 'make clean_cube && make clean_all && cd .. && rm -rf build && mkdir build && cd build && cmake ..'
abbr old_remake 'make clean_all clean_cube clean cube prepare; make -j'
abbr thunder 'cd ~/ThunderProjetos/'
abbr vim nvim
abbr ls exa
abbr ll 'exa -alh'
abbr bat batcat
abbr fzfc 'fzf | xclip -selection clipboard'
abbr cnvim 'cd ~/.config/nvim && nvim'
abbr ckitty 'cd ~/.config/kitty && nvim'

# Aliases
alias bat=batcat

# Configura atalhos para executar scripts Python no diretório $HOME/scripts
for file in $HOME/scripts/*.py
    set name (basename "$file" .py)
    abbr -a $name "python3 \"$file\""
end

# Funções personalizadas
# Define a mensagem de boas-vindas
function fish_greeting
    set system_language $LANG
    set -x LANG pt_BR.UTF-8

    set_color brblue
    cowsay -f tux (date +%l) e (date +%M) da madrugada de (date +%A) e vc trabalhando...
    set_color normal

    set -x LANG $system_language
end

# Compila um arquivo C e executa o resultado
function compile_c
    set name (ls *.c | head -n 1 | cut -d'.' -f1)
    mkdir -p out
    gcc "$name.c" -o "out/$name.o" -lm
    ./out/$name.o
end

# Cria um diretório e navega até ele
function take
    mkdir -p $argv
    cd $argv
end

# Clona um repositório Git e navega até o diretório criado
function clone
    git clone $argv
    cd (basename "$argv" .git)
end

# Abre o STM32CubeMX com um projeto ou vazio, conforme especificado
function cube
    # Verifica se a variável de ambiente CUBE_PATH está definida
    if test -z "$CUBE_PATH"
        echo "Erro: A variável de ambiente CUBE_PATH não está definida. Configure-a antes de usar o CubeMX."
        return 1
    end

    set -l project_path ""
    set -l verbose_mode false
    set -l open_empty false

    # Função para encontrar o arquivo .ioc
    function find_ioc
        set -l search_dirs "./cube" (realpath ..)/cube

        for dir in $search_dirs
            set project_path (find $dir -maxdepth 1 -name "*.ioc" -type f 2>/dev/null | sort -V | tail -n 1)
            if test -n "$project_path"
                echo "$project_path"
                return 0
            end
        end

        return 1
    end

    # Função de ajuda
    function show_help
        echo "Uso: cube [-v|--verbose] [-e|--empty] [caminho_do_projeto]"
        echo "  -v, --verbose  Ativa o modo verbose, exibindo mensagens detalhadas."
        echo "  -e, --empty    Abre o STM32CubeMX sem um projeto, caso nenhum caminho seja fornecido."
        echo "  caminho_do_projeto Caminho para o arquivo .ioc do projeto STM32CubeMX."
        echo "                    Se não fornecido e a flag -e não estiver presente, tentará encontrar automaticamente."

    end

    # Trata as flags fornecidas como argumento
    for arg in $argv
        switch $arg
            case -v --verbose
                set verbose_mode true
            case -e --empty
                set open_empty true
            case -h --help
                show_help
                return
            case *
                set project_path $arg
        end
    end

    if test -z "$project_path"
        set project_path (find_ioc)
    end

    if test "$verbose_mode" = true
        if test "$open_empty" = true -o -z "$project_path"
            echo "Modo verbose ativado. Abrindo o STM32CubeMX vazio."
            "$CUBE_PATH/STM32CubeMX"
        else
            echo "Modo verbose ativado. Abrindo o STM32CubeMX com o arquivo .ioc: $project_path"
            "$CUBE_PATH/STM32CubeMX" "$project_path"
        end
    else

        if test "$open_empty" = true -o -z "$project_path"
            echo "Abrindo STM32CubeMX vazio."
            "$CUBE_PATH/STM32CubeMX" >/dev/null 2>&1 &
            if test "$verbose_mode" = false
                disown %1
            end
        else
            echo "Abrindo o STM32CubeMX com o arquivo .ioc: $project_path"
            # Abre o STM32CubeMX com o arquivo .ioc encontrado e desassocia-o do terminal atual
            "$CUBE_PATH/STM32CubeMX" "$project_path" >/dev/null 2>&1 &
            disown %1
        end
    end
end

# Abre o repositório remoto no navegador
function open-remote
    set origin_url (git remote get-url origin)
    set repo_url (string match -r 'github\.com[:/](.*)\.git' $origin_url)[2]

    set url "https://github.com/$repo_url"

    if test -n "$url"
        echo "Abrindo repositório remoto no navegador: $url"
        open $url
    else
        echo "Não foi possível determinar o link remoto."
    end
end


# Função para gerar o link do Seafile.
# Uso: seafile-link <caminho_do_arquivo>
# Parâmetros:
#   - caminho_do_arquivo: O caminho local do arquivo no Seafile.
# Saída:
#   - O link correspondente ao arquivo no Seafile.
function seafile-link
    set base_url "https://drive.thunderatz.org/lib/347d7784-96f3-4b88-ada2-34acec0262f2/file/"
    set file_path $argv[1]

    # Substituir espaços por '%20' usando o comando sed
    set file_path (echo $file_path | sed 's/ /%20/g')

    echo $base_url$file_path
end

# Função para selecionar o arquivo usando fzf e gerar o link do Seafile.
# Uso: seafile-fzf [-o|--open]
# Parâmetros:
#   - -o, --open: Abrir automaticamente o link no navegador.
# Saída:
#   - Se um arquivo for selecionado, imprime o link do Seafile correspondente.
#   - Se nenhum arquivo for selecionado, exibe uma mensagem informando.
function seafile-fzf
    set -l open_in_browser false

    for arg in $argv
        switch $arg
            case -o --open
                set open_in_browser true
            case *
                echo "Opção desconhecida: $arg"
                return 1
        end
    end

    set selected_path (fzf)

    # Verificar se algo foi selecionado
    if test -n "$selected_path"
        # Remover as aspas simples
        set quoted_path (echo $selected_path | tr -d "'")

        # Gerar e imprimir o link do Seafile
        set seafile_link (seafile-link $quoted_path)

        echo $seafile_link

        # Abrir no navegador se a opção -o estiver presente
        if $open_in_browser
            open $seafile_link
        end
    else
        echo "Nenhum arquivo selecionado."
    end
end

# Comandos adicionais
eval "$(pyenv init -)"

# Plugins
fundle plugin 'jorgebucaran/nvm.fish'
fundle plugin 'ilancosman/tide@v6'
fundle plugin 'patrickf1/fzf.fish'
fundle plugin 'jorgebucaran/autopair.fish'
fundle plugin 'nickeb96/puffer-fish'
fundle plugin 'lig/fish-gitmoji' --url 'https://codeberg.org/lig/fish-gitmoji.git'

fundle init

# Keybindings
fzf_configure_bindings --directory=\cf
fzf_configure_bindings --variables=\c\sv
