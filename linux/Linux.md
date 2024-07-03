# BashTraining

## Terminal terminology
```
Terminal = old physical form 
Terminal emulator = system gui for command usage
Shell = User interface to interact with system
Bash = Bourne-Again SHell, shell inteaction language = One of Shells
Prompt = prlpnrpph512@pnrpph12:/bin$ 

$ = user
# - root

.bashrc = Bash configuration file.
```


Terminal Emulator -> Shell -> System

### Package managers
dpkg = low level package manager 
```bash
dpkg -l | grep name
```
apt
.deb = debian packages
aptitude jest jeszcze = gui

```bash
apt update
apt install name
apt edit-sources
apt -h 
apt list 
apt list --installed
apt list --installed | grep ^nmap
apt show name
apt search name
apt remove name = User data remains
apt purge name
apt upgrade 
apt update && apt upgrade full-upgrade
```

snap = snapd = Other PM
```bash
snap install --classic code = Install vscode
```

### Python 
```bash
pip install -r requirements.txt
```


## Linux File System
```
/ = Root
/bin = Binaries, Commands
/sbin = Admin commands
/usr = User directory, bin again
/usr/local = Local commands
/boot = Boot files
/var = Log files
/tmp = Temporary
/lib = Shared Library files
/home = Directory of users
/root = Directory of root
/dev = Devices
/sda or /vda = Hardrives 
/sda1 = partition
/etc = Etecera, etsy = Configuration files 
/etc/network = Network configuration files
/etc/network/interfaces = Network interfaces and ips etc
/media = System mouting files,  
/mnt = For mouting drivers yourself.
```

## Linux Commands

### General flags
```bash
command -h or --help = Command help
```

### Basic
```bash
whoami = User name
```
```bash
pwd = Current localisation
```
```bash
cat = Concatenate
```
```bash
cp file newfile = Copy
```
```bash
which = Where command is located
```
```bash
adduser = Admin add user
```
```bash
ps = Process status
```
```bash
cd Documents && clear```
### Information commands
```bash
hostname
```
```bash
uname = Information about system and computer
-a = All info
-r = Relase version(usefull to search for exploits)

```
```bash
id = Detailet uname, with all the users etc
```
```bash
ifconfig = Network information
```
```bash
ip = Network stuff again
link show or nmcli device show or ifconfig or netstat -i = Lists network interfaces
```
```bash
netstat = Networks stats
```
```bash
ss = Sesion stats
```
```bash
ps = Process stats
ps -u prlpnrpph512 | grep firefox
ps -aux
```
```bash
who = Who is logged to system
```
```bash
env = Eviorment variables
```
```bash
lsblk = List blocks = Hard drives stuff
```
```bash
lsusb = Usb devices list
```
```bash
lsof = List open files
```
### User managment
```bash
adduser name 
useradd = same but simple
useradd name -m = -m makes home direcotry
```
```bash
cat /etc/passwd = User list.
```
Passwords are stored in /etc/shadow
```bash
passwd username
```
```bash
usermod username --shell bash = Modify user
-l newusername username
```
```bash
sudo = super user do, gives root powers
su = switch user
su - = switches to root user
exit, logout = logs out of su
su - username = switches to username
sudoers file = users that can sudo
```
To edit sudoers file it is recomended to use:
```bash
sudo visudo
```
Here we can add users with sudo or just some sbin commands
```bash
# User privilege specification
root    ALL=(ALL:ALL) ALL

# Members of the admin group may gain root privileges
%admin ALL=(ALL) ALL

# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) ALL
user ALL = ALL

# Allow to use sudo with no password
user ALL = NOPASSWD:ALL
```
```bash
sudo userdel username = Deletes user

sudo groupadd groupname = Creates groups
To access: cat /etc/group
```
```bash
usermod -aG groupname username
gpasswd -d username groupname
groupdel groupaname = Deletes just group.
```
### Help and learing commands
```bash
man commandname = Detailed help
```
```bash
apropos whatyouwant = Lists commands related to what you want
```

## Daemons and Processes
Daemons like services. They run ssh, networks etc.
Systemd = Master daemon = Initialization system = init
Units = Daemons
```bash
pstree = Process tree.
```
```bash
ps -aux = all processes
```
```bash
systemctl stop named
systemctl status
systemctl start
systemctl restart
systemctl reload = reload-or-restart

systemctl disable ntp = Disable from starting with system
systemctl enable ntp

systemctl is-active name
systemctl is-enabled name

system list-units
        -t service = lists services

system list-unit-files = Lists all units and even the ones that are just file.

journalctl -xe = Lists logs.
```

## Processes
ps is just for terminal emulator. 
```bash
kill process-id

To find use 
pgrep firefox = Returns process id

top = Lists processes by CPU usage
htop = same but cool gui
```
### Foreground processes
```bash
ping -c  100 google.com = Ping -c count 100 times
sleep 30
```
Now lets press ctr+z
```bash
jobs = current terminal processes 
```
[1] = Id
```bash
bg 1
fg 1
ping -c 30 dupa.com & = makes it bg by start
```
It starts process with id 1 to run in backgound(is const visible)
```bash
kill -l = list of possible kill signals 
defeault is SIGTERM, which is soft kill, pls die and it can refuse

ctr+z = SIGSTOP
ctr+c = SIGINT = interupt

Full HARD KILL = SIGKILL
kill -19 <idofprocess>

pkill -9 ping = Kills all pings
```
## Shell related changes
```bash
ls
ls -la ~/ = Full ls
ls -l = Detailet ls
ls -la -al = More detailet ls
drwxrwxr-x = Type and premission + Hard links to directory + owners + size
```
```bash
vim ~/.bashrc = to open hidden file
```
Part of .bashrc which responds for colorfull propmpt.
```bash
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\@\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
```
```bash
\h     Hostname
\d     Date (Mon Feb 6)
\D{%Y-%m-%d}     Date (YYYY-MM-DD)
\H     Full hostname
\j     Number of jobs managed by the shell
\n     Newline
\r     Carriage return
\s     Name of the shell
\t     Current time 24-hour (HH:MM:SS)
\T     Current time 12-hour (HH:MM:SS)
@      Current time
\u     Current username
\w     Working directory
```

## Website and network
To run a serwer using python:
```bash
python -m http.server 8090
```
Loopback adress: 127.0.0.1 = localhost
Using php:
```bash
php -S 127.0.0.1:8086
```
Using npx:
```bash
npx http-server -p 8086
```
Starting apache servers:
```bash
systemctl start apache2
```
To access serwer write:
```bash
curl localhost:8086 = opens server content
curl -o coolwebsite localhost:8086 = downloads
wget localhost:8086 = downloads

curl -I localhost:8086 = information about server
curl -v localhost:8086 = sends requtest 
```
Client url, serves to comunicate with serwer.
HTTP 200 = SUPER
HTTP 404 = Not found

## Linux hacks and tricks
```bash
cd = /home
cd ../..
clear or ctr+l

cd - = previous directory
echo $OLDPWD
ll and la = aliases
alias lsfull="ls -al ~/"

TO add visit .bashrc

ctr+shitf+c = copy
ctr+a = begining line
ctr+e = ending
ctr+u = delete current line
ctr+y = bring it back
ctr+x+e = edit current command

/var/log/auth.log = log
less /var/log/auth.log
sudo !! = sudo <last command>

tail /var/log/auth.log = last 10 lines
tail -f /var/log/auth.log = last 10 lines = live log

ctr+r = search commands history
```
## File and folder managment
```bash
touch finename.xd
cat > file.txt
asdfasdfasdf ctr+d to end
cat << EOF > nameofile.txt
echo "DUPS" > name.txt
```
```bash
In this drwxr-xr-x 
d = directory
-r... = file

mkdir asdf asdf asdfa sf as = few direcotries

mv file ./directory
mv file ./direcotry/newname.txt
mv file file1 file2 ./directory

Copy to backup file: name.txt.bak

mkdir -p direcotry/one/one/one
tree = directory tree

rmdir = remove directory
rm -r directory/ = recursive directory delete
--no-preserve-root = we can remove everything

sudo rm -rf --no-preserve-root / = removes most of files
```
Script to make 1000mln directories:
```bash
#!/bin/bash

for i in {1..1500}
do
    mkdir -p ./$i/another
done
```

