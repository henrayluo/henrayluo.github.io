---
title: strace 在安卓逆向中的应用
date: 2020-07-04 11:42:21
tags: 逆向
---

使用:
```
./strace -p 16998 -f -x -y -e read=all -e write=all -o trace.txt
```

output(部分):
```
...
17046 openat(AT_FDCWD, "/proc/interrupts", O_RDONLY|O_LARGEFILE) = -1 EACCES (Permission denied)
17046 read(-1, 0xba60f7b8, 4095)        = -1 EBADF (Bad file descriptor)
17046 openat(AT_FDCWD, "/proc/diskstats", O_RDONLY|O_LARGEFILE) = -1 EACCES (Permission denied)
17033 <... ioctl resumed> , 0xc3fc2118) = 0
17031 <... ioctl resumed> , 0xbc2c6118) = 0
17046 read(-1,  <unfinished ...>
17033 futex(0xe831c514, FUTEX_WAKE_PRIVATE, 2147483647 <unfinished ...>
17046 <... read resumed> 0xba60f7b8, 4095) = -1 EBADF (Bad file descriptor)
17033 <... futex resumed> )             = 0
17046 openat(AT_FDCWD, "/proc/filesystems", O_RDONLY|O_LARGEFILE <unfinished ...>
17033 futex(0xe831c510, FUTEX_WAKE_PRIVATE, 1 <unfinished ...>
17031 futex(0xe831c510, FUTEX_WAIT_BITSET_PRIVATE, 2, NULL, FUTEX_BITSET_MATCH_ANY <unfinished ...>
17033 <... futex resumed> )             = 0
17031 <... futex resumed> )             = -1 EAGAIN (Try again)
17046 <... openat resumed> )            = -1 EACCES (Permission denied)
17031 futex(0xe831c510, FUTEX_WAKE_PRIVATE, 1 <unfinished ...>
17046 read(-1,  <unfinished ...>
17033 getpid( <unfinished ...>
17046 <... read resumed> 0xba60f7b8, 4095) = -1 EBADF (Bad file descriptor)
17033 <... getpid resumed> )            = 16998
17046 faccessat(AT_FDCWD, "/proc/sys/fs/binfmt_misc/arm", F_OK <unfinished ...>
17033 getuid32( <unfinished ...>
17031 <... futex resumed> )             = 0
17046 <... faccessat resumed> )         = -1 ENOENT (No such file or directory)
17033 <... getuid32 resumed> )          = 10217
17046 openat(AT_FDCWD, "/proc/self/maps", O_RDONLY|O_LARGEFILE <unfinished ...>
17031 futex(0xe831c514, FUTEX_WAKE_PRIVATE, 2147483647 <unfinished ...>
17033 futex(0xe831c510, FUTEX_WAIT_BITSET_PRIVATE, 2, NULL, FUTEX_BITSET_MATCH_ANY <unfinished ...>
17031 <... futex resumed> )             = 0
17046 <... openat resumed> )            = 139</proc/16998/maps>
17031 futex(0xe831c510, FUTEX_WAKE_PRIVATE, 1 <unfinished ...>
17046 read(139</proc/16998/maps>,  <unfinished ...>
17031 <... futex resumed> )             = 1
17033 <... futex resumed> )             = 0
17033 futex(0xe831c514, FUTEX_WAKE_PRIVATE, 2147483647 <unfinished ...>
17046 <... read resumed> "12c00000-13180000 rw-p 00000000 "..., 4095) = 3992
 | 00000  31 32 63 30 30 30 30 30  2d 31 33 31 38 30 30 30  12c00000-1318000 |
 | 00010  30 20 72 77 2d 70 20 30  30 30 30 30 30 30 30 20  0 rw-p 00000000  |
 | 00020  30 30 3a 30 30 20 30 20  20 20 20 20 20 20 20 20  00:00 0          |
 | 00030  20 20 20 20 20 20 20 20  20 20 20 20 20 20 20 20                   |
 | 00040  20 20 20 20 20 20 20 20  20 5b 61 6e 6f 6e 3a 64           [anon:d |
 | 00050  61 6c 76 69 6b 2d 6d 61  69 6e 20 73 70 61 63 65  alvik-main space |
 | 00060  20 28 72 65 67 69 6f 6e  20 73 70 61 63 65 29 5d   (region space)] |
 | 00070  0a 31 33 31 38 30 30 30  30 2d 31 33 33 30 30 30  .13180000-133000 |
 | 00080  30 30 20 72 77 2d 70 20  30 30 30 30 30 30 30 30  00 rw-p 00000000 |
 | 00090  20 30 30 3a 30 30 20 30  20 20 20 20 20 20 20 20   00:00 0         |
 | 000a0  20 20 20 20 20 20 20 20  20 20 20 20 20 20 20 20                   |
...
```

主要 -e 选项可以把读写数据以 hexadecimal and ASCII Dump出来并记录。