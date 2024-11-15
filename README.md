
# Mini Shell



## introduction

By definition, the Operating System (OS) acts as an interface between the user and the hardware. For the user the interface can be given either in form of Graphical User Interface (GUI) or Command Line Interface (CLI). Windows OS is a typical example for GUI example. Before the GUI supported by operating system, it was mainly operated by CLI. It was given different names in different Operating Systems. Some popular examples being DOS prompt of Windows or BASH prompt of Linux. 

These interfaces typically run in a text window, allowing the user to type commands which cause actions. Upon receiving commands the OS will parse the commands for its correctness and invoke appropriate application to perform a specific action. These action can range from opening a file to terminating an application. In case of Linux the BASH shell reads commands from a file, called a script. Like all Unix shells, it supports piping and variables as well, and eventually provides an output. 

The goal of this Linux Internals Projects for Beginners is to implement a mini-shell that mimics the BASH shell by using Linux Kernel System calls and IPC mechanisms like signals. It will handle a set of commands as called out below and also handle special keyboard actions (ex: Control C), can be extended for advanced functionalities (ex: Command history) as well. By implementing this Linux Internals Projects for Beginners as a developer you will get a real-time perspective about using Linux system calls to develop an important utility like CLI.




## Requirements Details

Here is the list of requirements that need to be implemented in this project: 
1) Provide a prompt for the user to enter commands:
2) Display the default prompt as **msh >**
3) Prompt should be customizable using environmental variable PS1 
- To change the prompt user will do PS1=NEW_PROMPT
- Make sure that you do not allow white spaces between = i.e., do not allow PS1 = NEW_PROMPT
- In the above case, it should be treated like a normal command
4) Execute the command entered by the user:
5) User will enter a command to execute
6) If it is an external command
- Create a child process and execute the command
- Parent should wait for the child to complete
- Only on completion, msh prompt should be displayed
- If a user entering without a command should show the prompt again
7) Special Variables:
- Exit status of the last command (echo $?)
   - After executing a command the exit status should be available
   - echo $? should print the exit status of the last command executed
- PID of msh (echo $$)
   - echo $$: should print msh’s PID
- Shell name (echo $SHELL)
   - echo $SHELL: should print msh executable path
8) Signal handling:
   - Provide shortcuts to send signals to running program
9) Ctrl-C (Send SIGINT) On pressing Ctrl-C
- If a programming is running in foreground, send SIGINT to the program (child process)
- If no foreground program exists, re-display the msh prompt
10) Ctrl+z (Send SIGSTP) On pressing Ctrl+z
- The program running in foreground, should stop the program and parent will display pid of child
11) Built-in commands:
- exit: This command will terminate the msh program
- cd: Change directory
- pwd: show the current working directory