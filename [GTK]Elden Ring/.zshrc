# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/xsisec/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

ZSH_THEME="powerlevel10k/powerlevel10k"

DISABLE_AUTO_UPDATE=true
#ZSH_THEME="hackthebox"

export VIRTUAL_ENV_DISABLE_PROMPT=1

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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

plugins=(git zsh-autosuggestions zsh-syntax-highlighting virtualenv)







export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/xsisec
source /home/xsisec/.virtualenvs/bin/activate


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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#alias shopt='/usr/bin/shopt'" >> ~/.zshrc"

echo ""
/home/xsisec/.config/HTB/banner.sh | /home/xsisec/.config/centertext.sh 
#figlet -c -f /home/xsisec/.local/share/figlet-fonts/3d.flf "XsiSec" | lolcat -S 4000
#/home/xsisec/.config/color-scripts/color-scripts/crunch | lolcat -s 400
fortune -s | toilet -f term -F border | /home/xsisec/.config/centertext.sh | lolcat -S 800
ansiweather -l Sweden,SE -u metric -s true -f 4 -d true -a false | lolcat -S 800
#ansiweather -l Sweden,SE -u metric -s true -f 4 -d true






if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


POWERLEVEL10K_PROMPT_ADD_NEWLINE=true

#source ~/powerlevel10k/powerlevel10k.zsh-theme





# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


alias open='xdg-open'

alias fd=fdfind


function virtualenv_info { 
[ $VIRTUAL_ENV ] && echo ‘(‘`basename $VIRTUAL_ENV`’) ‘ 
}



loginaws(){
/home/xsisec/.local/bin/saml2aws login --role arn:aws:sts::916676940122:assumed-role/dev-sso-dmdp-tester-role/khpv724
export AWS_PROFILE=saml
}

refreshaws(){
/home/xsisec/.local/bin/saml2aws login --role arn:aws:sts::916676940122:assumed-role/dev-sso-dmdp-tester-role/khpv724 --force
export AWS_PROFILE=saml
}


# Print my public IP
alias myip='curl ipinfo.io/ip'



mining()
{
/home/xsisec/Documents/miner/t-rex/t-rex-0.23.1-linux/ETH-ethermine.sh
}

slf(){
	source /home/xsisec/.bashrc
	source /home/xsisec/.vimrc
	source /home/xsisec/.zshrc
}



bp(){
export {http,https,ftp}_proxy=127.0.0.1:8080
echo "Proxy environment variables set successfully!"
}
bpany(){
curl --proxy http://localhost:8080 $1	
}



mytime()
{
today=$(TZ=":$1" date)
echo $today
}

setupweb(){
mitmproxyweb
export http_proxy=localhost:8080
export https_proxy=localhost:8080
curl ifconfig.io
wget -O /dev/null ifconfig.io
echo "proxy setup"
}

setupproxy(){
mitmproxy
export http_proxy=localhost:8080
export https_proxy=localhost:8080
curl ifconfig.io
wget -O /dev/null ifconfig.io
echo "proxy setup"
}

unsetproxy(){
http_proxy
https_proxy
echo "unset proxy setup"
}


#vim

dub(){
	g/^\(.*\)$\n\1$/p
}



#BASE64
v1(){
echo U3RhbGluY2hrZHNrNjc0NzIwMjA5ODkxIQo=
}
v2(){
echo U3RhbGludmJveGVzNjc0NzIwMjA5ODkxIQo=
}

enc64(){
echo $1 | base64	
}

dec64(){
echo $1 | base64 -d
	
}


#repo
dp(){
cd /home/xsisec/ideaProjects/az-dmdp-test-scripts/scripts/dmdp2
}

#current RT doc
rt()
{
(cd /home/xsisec/IdeaProjects/az-dmdp-test-scripts/scripts/dmdp2/formal-tests/RT34/)
}






#SWAGGER --------- BEGIN -----------
#Other tools
swagger()
{
cd /home/xsisec/Documents/Program/swagger-editor-master/ && python -m http.server 8080
echo "started Swagger successfully!"
}
sw1()
{
cd /home/xsisec/Documents/Program/swagger-editor-master/ && python -m http.server 8081
echo "started Swagger successfully!"
}

sw2()
{
cd /home/xsisec/Documents/Program/swagger-editor-master/ &&  python -m http.server 8082
echo "started Swagger successfully!"
}

sw3()
{
cd /home/xsisec/Documents/Program/swagger-editor-master/ && python -m http.server 8083
echo "started Swagger successfully!"
}

sw4()
{
cd /home/xsisec/Documents/Program/swagger-editor-master/ && python -m http.server 8084
echo "started Swagger successfully!"
}

#CUCUMBER--------- END -----------

#DECODE JWT TOKEN --------- BEGIN -----------
jd(){
/home/xsisec/.config/JWTDecode.sh $1
}

#DECODE JWT TOKEN --------- END -----------



mvnclean(){
mvn clean install -DskipTests
}

ccrun(){
echo "Starting Cucumber..."
mvn verify -pl systemtest-cucumber  -Dprofile=sysops-remote-test -Dcucumber.filter.tags=$1

}

ginforminit(){
	 git add . 
	 git commit -m "[DPL-$1] [INF] - initial tests [$2]"
	}

ginforminitup(){
	 git add . 
	 git commit -m  "[DPL-$1] [INF] - initial tests, updated RTXX [$2]"
	}
	


source ~/powerlevel10k/powerlevel10k.zsh-theme
export PATH="$PATH:$HOME/.spicetify"
