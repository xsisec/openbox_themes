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




#DMDP


#repo
dp(){
cd /home/xsisec/ideaProjects/az-dmdp-test-scripts/scripts/dmdp2
}

#current RT doc
rt()
{
(cd /home/xsisec/IdeaProjects/az-dmdp-test-scripts/scripts/dmdp2/formal-tests/RT34/)
}


#--------------------------------- ENVIORNMENTS  -----------------------------------

#DEV02

dev02r()
{
export HOST=dmdp-dev02.dev-dmdp-sysops02.dmdp-dev.astrazeneca.com
echo "Host is set successfully!"
(cd /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/CreateUsersAndActivateAndGetTokens/dev02/daniel_tenant_1/ && pwd && exec ./dev02.bash)
source /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/CreateUsersAndActivateAndGetTokens/dev02/daniel_tenant_1/dev02Env.bash
}


#DEV02-----

dev02s()
{
export HOST=dmdp-dev02.dev-dmdp-sysops02.dmdp-dev.astrazeneca.com
echo "Host is set successfully!"
source /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/CreateUsersAndActivateAndGetTokens/dev02/daniel_tenant_1/dev02Env.bash
echo "Sourced dev02 successfully!"
}

#VIM TOKEN DEV02
devvr()
{
export HOST=dmdp-dev02.dev-dmdp-sysops02.dmdp-dev.astrazeneca.com
echo "Host is set successfully!"
(cd /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/CreateUsersAndActivateAndGetTokens/dev02/daniel_tenant_1/  && exec ./dev02.bash)
source /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/CreateUsersAndActivateAndGetTokens/dev02/daniel_tenant_1/dev02Env.bash
echo "Sourced dev02 successfully!"
}


#VIM TOKEN DEV02
devvs()
{
export HOST=dmdp-dev02.dev-dmdp-sysops02.dmdp-dev.astrazeneca.com
echo "Host is set successfully!"
source /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/CreateUsersAndActivateAndGetTokens/dev02/daniel_tenant_1/dev02Env.bash
echo "Sourced dev02 successfully!"
}


#DEV02----- BEGIN -----------
dev02h()
{
export HOST=dmdp-dev02.dev-dmdp-sysops02.dmdp-dev.astrazeneca.com
echo "Host is set successfully!"
}


#VIM TOKEN DEV02
pptr()
{
export HOST=dmdp-dev02.dev-dmdp-sysops02.dmdp-dev.astrazeneca.com
echo "Host is set successfully!"
(cd /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/CreateUsersAndActivateAndGetTokens/ppt01/daniel_tenant_2/  && exec ./ppt01.bash)
source /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/CreateUsersAndActivateAndGetTokens/ppt01/daniel_tenant_2/ppt01Env.bash
echo "Sourced dev02 successfully!"
}


#VIM TOKEN DEV02
ppts()
{
export HOST=dmdp-dev02.dev-dmdp-sysops02.dmdp-dev.astrazeneca.com
echo "Host is set successfully!"
source /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/CreateUsersAndActivateAndGetTokens/ppt01/daniel_tenant_2/ppt01Env.bash
echo "Sourced dev02 successfully!"
}

#get platform admin token
gpldev(){
(cd /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/Tenant/tokens/dev02/ && pwd && exec ./Generate_PA_token.bash)
source /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/Tenant/tokens/dev02/dev02Env.bash
}

#SET DEV02
setd(){
	eus
	dev02h
	gpldev
	bp
	
}


#DEV02----- END -----------


#SIT01----- BEGIN -----------
sit01h()
{
export HOST=dmdp-sit01.sit-dmdp-sysops02.dmdp-sit.astrazeneca.com
echo "Host is set successfully!"
}




#get platform admin token
gplsit(){
(cd /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/Tenant/tokens/sit01/ && pwd && exec ./Generate_PA_token.bash)
source /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/Tenant/tokens/sit01/sit01Env.bash
}

setsit(){
	eus
	sit01h
	gplsit
	bp
}
	



#SIT01----- END -----------

#PPT01--------- BEGIN -----------

ppt01h(){
export HOST=dmdp-ppt01.ppt-dmdp-sysops01.dmdp-ppt.astrazeneca.com
echo "Host is set successfully!"
}

ppt01h()
{
export HOST=dmdp-ppt01.ppt-dmdp-sysops01.dmdp-ppt.astrazeneca.com
echo "Host is set successfully!"
}


gplppt(){
(cd /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/Tenant/tokens/ppt01/ && pwd && exec ./Generate_PA_token.bash)
source /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/Tenant/tokens/ppt01/ppt01Env.bash
}

#PPT01--------- END -----------

#-------------------------- ENVIORNMENTS END ------------------------







#---------------------------- OTHER TOOLS -----------------------------
#AWS--------- BEGIN -----------
awslogin(){
/home/xsisec/saml2aws login --role=arn:aws:iam::916676940122:role/dev-sso-dmdp-tester-role
export AWS_PROFILE=saml
}

awsr(){	
/home/xsisec/saml2aws login --role=arn:aws:iam::916676940122:role/dev-sso-dmdp-tester-role --force
export AWS_PROFILE=saml
}

awprof(){
export AWS_PROFILE=saml
/home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/Tenant/get_tenant_audit_files/get_tenant_audit_files.py
	
}

#AWS--------- END -----------

#CUCUMBER--------- BEGIN -----------

cucumberenv(){
export NAMESPACE=dev02
export DMDP_ENVIRONMENT=dev
export CLUSTER=dev-dmdp-sysops02
export DMDP_PLATFORM_ADMIN_CLIENT_SECRET=JYjnYrBbYkGamMJU
export DMDP_SERVICE_WRITER_CLIENT_SECRET=krmMeyjvVzcSiPRjW
export DMDP_SERVICE_STUDY_ADMIN_CLIENT=sRvDK3N4*x#GfCjN5*
export DMDP_WIREMOCK_BASIC_AUTH=dmdp:"^ZP2piYVvg&Ngo6x0z@V"
export DMDP_SERVICE_CSA_CLIENT="d&S2#OcfJM21Ijmz"
}
#CUCUMBER--------- BEGIN -----------


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



#TENANT RELATED --------- BEGIN -----------

crttu()
{
(cd /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/CreateUsersAndActivateAndGetTokens/dev02/daniel_tenant_1/ && pwd && exec ./CreateOrganizationTreeWithUsers.bash $1 $2 $3 $4 $5 $6 $7)
}


#create TENANT and activate the user
crta()
{
(cd /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/Tenant/CreateaAndActivate/ && pwd && exec ./CreateTenantAndPlatformAdmin.bash $1 $2 $3 $4)

}

#create tenant with users.
crtwu()
{
(cd /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/Tenant/CreateaAndActivate/ && pwd && exec ./CreateTenantAndPlatformAdmin.bash $1 $2 $3 $4)

}

#create a user
cru()
{
(cd /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/Tenant/CreateaAndActivate/ && pwd && exec ./createUser.bash $1 $2 $3 $4 $5 $6)

}

crhp(){
	
(cd /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/Tenant/CreateaAndActivate  && pwd && exec ./CreateHCPAndPatient.bash $1 $2)
	
}

locktr()
{
(cd /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/Tenant/lock/ && pwd && exec ./LockAllOrgTrees.bash $1)

}


#remove all users except tenant admin
rau(){
(cd /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/CreateUsersAndActivateAndGetTokens/dev02/daniel_tenant_1 && pwd && exec ./RemoveAllUsersForATenantAsTenant_Admin.bash $1)

}

#create org tree
crtr()
{
(cd /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/Tenant/Creation/ && pwd && exec ./CreateOrgTree.bash $1)
}


crtt(){
(cd /home/xsisec/ideaProjects/az-dmdp-test-scripts/tools/Tenant/Creation/ && pwd && exec ./CreateTenantAndPlatformAdmin.bash $1 $2 $3)
	
}

#TENANT RELATED --------- END -----------

#set all user roles
eus(){

	export TENANT_ADMIN=''
	export ORG_ADMIN=''
	export ANALYST=''
	export PRACTITIONER=''
	export CRA=''
	export PI=''
	export INVESTIGATOR=''
	export STUDY_ASST=''
	export READ_ALL=''
	export PATIENT=''
	echo "set all users variables successfully!"
}


cmsprod(){
	
export CMS_USERNAME="78083993-4ca8-45fb-8ceb-b311497351eb"
export CMS_PASSWORD="31S9WmTeS303tP1YofKhUEEDjg35SD0njuyR1H61LTB6h4R6rBlQQtzGY8kx8zKDOCRvfYMmOSrjqgaETspDqDDSdeeYuvJ3pKxGBnG12yE="
export CMS_CLIENT_KEY="a9d5ef41-910b-4491-a2b7-c9da021f5d0b"
export CMS_CLIENT_SECRET="8M5t5OFTIAYV87IlQ0Crrb1icldPSV4YHOmr9OV2tKIoXghkXI5+jjqoYW1fH5wgOmb/dG3zieQ7lvkQUl2Fm0tbee1OSjDWnt/++P0/aaE="
export CDN_URL="https://d1vwq0ndpegvdk.cloudfront.net"
export CDN_API_KEY=APKAJMB6PRWQUR2ZR7WA

export CMS_REPOSITORY_ID="7ae9fca51a95dcbf0171"
export CMS_BRANCH_ID="8efe6434a81080afdf77"  #MASTER BRANCH
export CMS_BRANCH_ID1="111daa07111147abede5"  #OLD TEST STABLE BRANCH
export CMS_BRANCH_ID2="cdcc058d811f6a686df2"  #OLD TEST STABLE BRANCH
}


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
	
cucumberenv(){
export NAMESPACE=dev02
export DMDP_ENVIRONMENT=dev
export CLUSTER=dev-dmdp-sysops02
export DMDP_PLATFORM_ADMIN_CLIENT_SECRET=JYjnYrBbYkGamMJU
export DMDP_SERVICE_WRITER_CLIENT_SECRET=krmMeyjvVzcSiPRjW
export DMDP_SERVICE_STUDY_ADMIN_CLIENT=sRvDK3N4*x#GfCjN5*
export DMDP_WIREMOCK_BASIC_AUTH=dmdp:"^ZP2piYVvg&Ngo6x0z@V"
export DMDP_SERVICE_CSA_CLIENT="d&S2#OcfJM21Ijmz"
echo "sourced Env-vars for Cucumber!"
}


source ~/powerlevel10k/powerlevel10k.zsh-theme
export PATH="$PATH:$HOME/.spicetify"
