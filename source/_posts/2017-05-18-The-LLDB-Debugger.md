title: The LLDB Debugger
date: 2017-05-18 21:15:21
tags:
---


###   Getting Started

**编写如下程序保存为a.m**

```
#import <Foundation/Foundation.h>

int main(){
    NSLog(@"Hello World!");
    return 0;
}
```

<!-- more -->

**终端输入**

> gcc -framework Foundation a.m

**运行 xcrun lldb / lldb 进入 lldb**


```
% xcrun lldb
(lldb) file a.out
(lldb) b main
(lldb) run
(lldb) bt
(lldb) step
(lldb) step
(lldb) print argc
(lldb) next
(lldb) next
(lldb) q
```

=

```
% xcrun lldb
(lldb) target create a.out
(lldb) breakpoint set --name main
(lldb) process launch
(lldb) thread backtrace
(lldb) thread step-in
(lldb) thread step-in
(lldb) expression argc
(lldb) thread step-over
(lldb) thread step-over
(lldb) quit
```

### 语法Commend Syntax


**Noun and verb**

```
<noun> <verb>
(lldb) target create
(lldb) breakpoint set
(lldb) process launch
(lldb) thread step-in
(lldb) frame variable
```

**Shell style options**


```
<noun> <verb> [options]
(lldb) target create --arch i386
(lldb) breakpoint set --name main
(lldb) process launch --stop-at-entry
(lldb) thread step-in
(lldb) frame variable --format hex
```

**Arguments**

```
<noun> <verb> [options] [argument [argument...]]
(lldb) target create --arch i386 /bin/ls
(lldb) breakpoint set --name main
(lldb) process launch --stop-at-entry -- -lAF /tmp
(lldb) thread step-in
(lldb) frame variable --format hex argc argv[0]
```

=

```
<noun> <verb> [options] [argument [argument...]]
(lldb) ta c /bin/ls -a i386
(lldb) br s -n main
(lldb) pro la -s -- -lAF /tmp
(lldb) th step-in
(lldb) fr v -f x argc argv[0]
```

###  术语Terminology

**target**

```
(lldb) target create /bin/ls
(lldb) breakpoint set --name malloc
(lldb) process launch -- -lAF /tmp
(lldb) target create /bin/cat
(lldb) breakpoint set --name free
(lldb) process launch -- /tmp/test.txt
(lldb) target list
Current targets:
target #0: /bin/ls (arch=x86_64,pid=18879,state=stopped
* target #1: /bin/cat (arch=x86_64,pid=18885,state=stoppe
(lldb) target select 0
(lldb) thread backtrace
(lldb) target select 1
(lldb) thread backtrace
```

**process**

```
(lldb) process attach --pid 123
(lldb) process attach --name Safari
(lldb) target create /Applications/Safari.app
(lldb) process attach
(lldb) target create com.apple.my_xpc_service
(lldb) process attach --waitfor
(lldb) process continue
(lldb) continue
(lldb) c
^C
```

**thread**


```
(lldb) thread
Available completions:   backtrace
continue
list
select
step-in
step-inst
step-inst-over
step-out
step-over
until
(lldb) thread list (lldb) thread select 12 (lldb) thread backtrace (lldb) bt
(lldb) bt all
```

**frame**


```
(lldb) frame
Available completions:   info
select
variable
(lldb) frame select 12 (lldb) f 12
(lldb) up
(lldb) down
(lldb) frame variable (gdb) info locals (gdb) info args
```

**modules**

```
(lldb) target modules list
(gdb) info shared
(lldb) target modules list [file1 ...]
(lldb) target modules dump symtab [file1 ...]
(lldb) target modules dump sections [file1 ...]
(lldb) target modules lookup --address <address>
(lldb) target modules lookup --type <name>
```

###  Help

**syntax: help [command]**

> (lldb) help memory read

**syntax: help <option-type>**

> (lldb) help <format>

###  Apropos

**syntax: apropos <keyword>**

> (lldb) apropos thread


###  Customizing commands

**Aliasing**


```
(lldb) command alias <name> <command> [<arg1> <arg2> ...]
(lldb) command alias up frame select --relative=1
(lldb) command alias down frame select -r-1
(lldb) command alias disasm-range
disassemble
--start-address %1
--end-address %2
```


**syntax: command regex <name> [s/<regex>/<subst>/ ...]**


```
(lldb) command regex f
“s/^([0-9]+)$/frame select %1/”
“s/^([+-][0-9]+)$/frame select --relative=%1/”
“s/^(.*)$/frame variable %1/”
(lldb) f 12
frame select 12
(lldb) f +2
frame select --relative=+2
(lldb) f -1
frame select --relative=-1
(lldb) f
frame variable
(lldb) f argc argv
frame variable argc argv
```

**Python Command Add “ls” command**

```
% cat /tmp/lldbshell.py
#!/usr/bin/python
import lldb
import commands
def ls_cmd(debugger, command, result, dict):
shell_cmd = '/bin/ls %s' % command
shell_result = commands.getoutput(shell_cmd)
result.PutCString(shell_result)
% xcrun lldb
(lldb) command script import /tmp/lldbshell.py
(lldb) command script add
--function lldbshell.ls_cmd
ls
```

### Debug Session

**Setting default formats**

```
(lldb) type format add
--format hex
uintptr_t intptr_t off_t
(lldb) print ptr
(uintptr_t) ptr = 0x0000000100000000
(lldb) print ptrs
(uintptr_t [2]) ptrs = {
[0] = 0x0000000000001111
[1] = 0x0000000000002222
}
```

### Type Summary Strings
**Summary string syntax**


• String can contain plain text and variables and formats • Variables references
> ${var[path][%<format>]}
•Formats characters can be listed with:
>     (lldb) help <format>
• Example summary strings
> “natural = ${var}, octal = ${var%o} , hex = ${var%x}” “( x = ${var.x}, y = ${var.y} )”
> “string = ${var._M_dataplus._M_p%s}”





