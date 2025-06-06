# LINUX 
Commands

  - Shell Job Control

    - jobs

      -  List your jobs.

    - &

      - Run a job in the background.

    - ^Z

      - Suspend the current (foreground) job.

    - suspend

      - Suspend a shell.

    - fg

      - Unsuspend a job: bring it into the foreground.

    - bg

      - Make a suspended job run in the background.

  - Basic File Operations

    - ls

      -  List files in a directory.

    - cp

      - Copy a file.

    - mv

      -  Rename (“move”) a file.

    - rm

      -  Delete (“remove”) a file.

    - ln

      - Create links (alternative names) to a file.

    - shred

      - Completely erase a file when the file is deleted
        > The operating system does not completely erase a file when the file is deleted.the file could be recovered by third party forensic tools. But we can use the SHRED command to overwrite a file to make it almost impossible for it to be recovered. The file is overwritten three times, by default,which can be changed by the -n option

  - Directory Operations

    - cd

      - Change your current directory.

    - pwd

      - Print the name of your current directory, i.e., “where you are now” in the        filesystem.

    - basename

      - Print the final part of a file path.

    - dirname

      - Print a file path without its final part.

    - mkdir

      -  Create (make) a directory.

    - rmdir

      -  Delete (remove) an empty directory.

    - rm -r

      - Delete a nonempty directory and its contents.

  - File Viewing

    - cat

      - View files in their entirety.

    - less

      - View text files one page at a time.

    - head

      -  View the first lines of a text file.

    - tail

      -  View the last lines of a text file.

    - nl

      - View text files with their lines numbered.

    - strings

      - Display text that’s embedded in a binary file.

    - od

      - View data in octal (or other formats).

    - xxd

      - View data in hexadecimal.

    - acroread

      - View PDF files.

    - gv

      - View PostScript or PDF files.

    - xdvi

      -  View TeX DVI files.

  - File Creation and Editing

    - emacs

      - Text editor from Free Software Foundation.

    - vim

      - Text editor, extension of Unix vi.

    - soffice 

      - Office suite for editing Microsoft Word, Excel, and PowerPoint documents.

    - abiword

      -  Edit Microsoft Word documents.

    - gnumeric 

      - Edit Excel spreadsheets.

  - File Properties

    - stat

      -  Display attributes of files and directories.
        > The stat command displays the status of a file.The information is much more when compared to ls -l. It also includes the absolute path,Number of blocks used by the file,access time, time of modification etc.,,
        > 

    - wc 

      - Count bytes, words, lines in a file.

    - du

      -  Measure disk usage of files and directories.

    - file

      - Identify (guess) the type of a file.

    - touch

      -  Change timestamps of files and directories.

    - chown

      -  Change owner of files and directories.

    - chgrp

      - Change group ownership of files and directories.

    - chmod

      -  Change protection mode of files and directories.

    - umask

      -  Set a default mode for new files and directories.

    - chattr

      -  Change extended attributes of files and directories.

    - lsattr

      -  List extended attributes of files and directories.

  - File Location

    - find

      -  Locate files in a directory hierarchy.

    - xargs

      -  Process a list of located files (and much more).

    - locate

      -  Create an index of files, and search the index for string.

    - which

      -  Locate executables in your search path (command).

    - type

      -  Locate executables in your search path (bash built-in).

    - whereis

      -  Locate executables, documentation, and source files.

  - File Text Manipulation

    - grep

      -  Find lines in a file that match a regular expression.

    - cut

      -  Extract columns from a file.

    - paste

      -  Append columns.

    - tr

      -  Translate characters into other characters.

    - sort

      -  Sort lines of text by various criteria.

    - uniq

      -  Locate identical lines in a file.

    - tee

      -  Copy a file and print it on standard output, simultaneously.

  - File Compression and Packaging

    - tar

      -  Package multiple files into a single file.

    - gzip

      -  Compress files with GNU Zip.

    - gunzip

      -  Uncompress GNU Zip files.

    - bzip2

      -  Compress files in BZip format.

    - bunzip2

      -  Uncompress BZip files.

    - bzcat

      -  Compress/uncompress BZip files via standard input/output.

    - compress

      -  Compress files with traditional Unix compression.

    - uncompress

      -  Uncompress files with traditional Unix compression.

    - zcat

      -  Compress/uncompress file via standard input/output (gzip or compress).

    - zip

      -  Compress files in Windows Zip format.

    - unzip

      -  Uncompress Windows Zip files.

    - metamail

      -  Extract MIME data to files.

  - File Comparison

    - diff

      -  Line-by-line comparison of two files or directories.

    - comm

      -  Line-by-line comparison of two sorted files.

    - cmp

      -  Byte-by-byte comparison of two files.

    - md5sum

      -  Compute a checksum of the given files (MD5).

  - Printing

    - lpr

      - Print a file.

    - lpq

      -  View the print queue.

    - lprm

      -  Remove a print job from the queue.

  - Spell Checking

    - look

      -  Look up the spelling of a word quickly.

    - aspell

      -  Interactive spelling checker.

    - spell

      -  Batch spelling checker.

  - Disks and Filesystems

    - df

      -  Display available space on mounted filesystems.

    - mount

      -  Make a disk partition accessible.

    - umount

      -  Unmount a disk partition (make it inaccessible).

    - fsck

      -  Check a disk partition for errors.

    - sync

      -  Flush all disk caches to disk.

    - lshw

    - inxi

    - lsblk

  - Backups and Remote Storage

    - dump

      -  Write a disk partition to a backup medium.

    - restore

      -  Restore the results of a dump.

    - cdrecord

      -  Burn a CD, DVD, or Blu-ray disc.

    - rsync

      -  Mirror a set of files onto another device or host.

    - mt

      -  Control a tape drive.

  - Viewing Processes

    - ps

      -  List process.

    - uptime

      -  View the system load.

    - w

      -  List active processes for all users.

    - top

      -  Monitor resource-intensive processes interactively.

    - htop

    - iotop

    - powertop

    - gnome-system-monitor

      -  Monitor system load and processes graphically.

    - xload

      -  Simple, graphical monitor of system load.

    - free

      -  Display free memory.

    - pidof

      -  Command, which looks up and prints the PID of a process by its name

    - nmon

  - check

    - ssh

    - munin - monitoring

  - Controlling Processes

    - kill

      -  Terminate a process (or send it a signal).

    - killall

    - nice

      -  Invoke a program at a particular priority.

    - renice

      -  Change a process’s priority as it runs.

    - cpulimit

  - Scheduling Jobs

    - sleep

      -  Wait a set number of seconds, doing nothing.

    - watch

      -  Run a program at set intervals.
        > The watch command can be used to repeat a command at fixed intervals.the default interval is 2 second.the interval can be changed with -n option
        > 

    - at

      -  Schedule a job for a single, future time.

    - crontab

      -  Schedule jobs for many future times.

  - Logins, Logouts, and Shutdowns

    - shutdown

      - Halts or reboots a Linux system

  - Users and Their Environment

    - logname

      -  Print your login name.

    - whoami

      -  Print your current, effective username.

    - id

      -  Print the user ID and group membership of a user.

    - who

      -  List logged-in users, long output.

    - users

      -  List logged-in users, short output.

    - finger

      -  Print information about users.

    - last

      -  Determine when someone last logged in.

    - printenv

      -  Print your environment.

  - User Account Management

    - useradd

      -  Create an account.

    - userdel

      -  Delete an account.

    - usermod

      -  Modify an account.

    - passwd

      -  Change a password.

    - chfn

      -  Change a user’s personal information.

    - chsh

      -  Change a user’s shell.

  - Group Management

    - groups

      -  Print the group membership of a user.

    - groupadd

      -  Create a group.

    - groupdel

      -  Delete a group.

    - groupmod

      -  Modify a group.

  - Host Information

    - uname

      -  Print basic system information.

    - hostname

      -  Print the system’s hostname.

    - dnsdomainname

      -  Same as hostname -d.

    - domainname

      -  Same as hostname -y.

    - nisdomainname

      -  Same as hostname -y.

    - ypdomainname

      -  Same as hostname -y.

    - ip

      -  Set and display network interface information.

    - ifconfig

      -  Older command to set and display network interface information.

  - Host Location

    - host

      -  Look up hostnames, IP addresses, and DNS info.

    - whois

      -  Look up the registrants of Internet domains.

    - ping

      -  Check if a remote host is reachable.

    - traceroute

      -  View the network path to a remote host.

    - dig

      - ex
        > dig proacta.pl +trace
        > dig -t ANY proacta.pl

      - http://kb.mediatemple.net/questions/909/Understanding+the+dig+command

      - http://www.cyberciti.biz/faq/linux-unix-dig-command-examples-usage-syntax/

  - Network Connections
    > uname -a
    > lspci -nnk | grep -iA2 net
    > lsusb
    > lsmod
    > iwconfig
    > rfkill list
    > 

    - ssh

      -  Securely log into a remote host, or run commands on it.

    - telnet

      -  Log into a remote host (insecure!).

    - scp

      -  Securely copy files to/from a remote host (batch).

    - sftp

      -  Securely copy files to/from a remote host (interactive).

    - ftp

      -  Copy files to/from a remote host (interactive, insecure!).

  - Email

    - thunderbird

      -  Graphical mail client.

    - evolution

      -  Graphical mail client.

    - mutt

      -  Text-based mail client.

    - mail

      -  Minimal text-based mail client.

    - mailq

      -  View the outgoing mail queue on your system.

  - Web Browsing

    - firefox

      -  Full-featured web browser.

    - lynx

      -  Text-only web browser.

    - wget

      -  Download web pages and files.

  - Usenet News

    - slrn

      - Usenet newsreader

  - Instant Messaging

    - gaim

      -  Instant messaging and IRC client.

    - talk

      -  Linux/Unix chat program.

    - write

      -  Send messages to a terminal.

    - mesg

      -  Prohibit talk and write.

    - tty

      -  Print your terminal device name.

  - Screen Output

    - echo

      -  Print simple text on standard output.

    - printf

      -  Print formatted text on standard output.

    - yes

      -  Print repeated text on standard output.

    - seq

      -  Print a sequence of numbers on standard output.

    - clear

      -  Clear the screen or window.

  - Math and Calculations

    - xcalc

      -  Display a graphical calculator.

    - expr

      -  Evaluate simple math on the command line.

    - dc

      -  Text-based calculator.

  - Dates and Times

    - xclock

      -  Display a graphical clock.

    - cal

      -  Print a calendar.

    - date

      -  Print or set the date and time.

    - ntpdate

      -  Set the system time using a remote timeserver.

  - Graphics and Screensavers

    - eog

      -  Display graphics files.

    - geeqie

      -  Display graphics files and slideshows.

    - ksnapshot

      -  Take a screenshot (screen capture).

    - gimp

      -  Edit graphics files.

    - dia

      -  Draw structured diagrams.

    - gnuplot

      -  Create graphs and plots.

    - xscreensaver

      -  Run a screensaver.

  - Audio

    - amarok, rhythmbox, xmms

      -  Audio file players (MP3, WAV, OGG).

    - grip

      -  CD player, ripper, and MP3 encoder.

    - cdparanoia

      -  Rip audio from CDs to WAV files.

    - lame

      -  Convert from WAV to MP3.

    - id3tag

      -  Edit ID3 tags.

    - audacity

      -  Edit audio files.

    - k3b

      -  CD burner with graphical interface.

  - Video

    - mplayer

      -  Video file playback.

    - gxine

      -  Simple DVD player.

    - kino

      -  Video editor.

    - HandBrake

      -  Video ripper.

  - Network

    - traceroute

      -  View the network path to a remote host.

    - ifconfig

      -  Older command to set and display network interface information.

    - netstat

      - Commands
        > Aktualne polaczenia TCP w systemie. (-anu wskazuje na polaczenia UDP)
        > netstat -ant
        > Aktualne polaczenia wraz z numerami PID
        > netstat -tulpn 
        > 

    - who

      -  List logged-in users, long output.

    - tcpdump

    - ping

      -  Check if a remote host is reachable.

    - ifup/ifdown

    - nslookup

    - dig

    - mtr

      - mtr combines the functionality of the traceroute and ping programs in a single network diagnostic tool
        > As mtr starts, it investigates the network connection between the host mtr runs on and HOSTNAME.  by sending packets with purposely low TTLs. It continues to send packets with low  TTL, noting the response time of the intervening routers.  This allows mtr to print the response percentage and response times of the internet route to HOSTNAME.  A sudden increase in packet loss or response time is often an indication of a bad (or simply overloaded) link. The results are usually reported as round-trip-response times in miliseconds and the percentage of packetloss.
        > 

