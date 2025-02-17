

While spinning up contiainer using `docker compose up`, we faced this error - `failed to register layer: write /flagd-build: no space left on device`

```
failed to register layer: write /flagd-build: no space left on device
ubuntu@ip-172-31-32-192:~/ultimate-devops-project-demo$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       6.8G  5.1G  1.7G  75% /
tmpfs           3.9G     0  3.9G   0% /dev/shm
tmpfs           1.6G  928K  1.6G   1% /run
tmpfs           5.0M     0  5.0M   0% /run/lock
/dev/xvda16     881M   76M  744M  10% /boot
/dev/xvda15     105M  6.1M   99M   6% /boot/efi
tmpfs           794M   12K  794M   1% /run/user/1000
```
We will resize of volume to 30 GB

## Resizing file system

`lsblk`
```

NAME     MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0      7:0    0 26.3M  1 loop /snap/amazon-ssm-agent/9881
loop1      7:1    0 73.9M  1 loop /snap/core22/1722
loop2      7:2    0 44.4M  1 loop /snap/snapd/23545
xvda     202:0    0   30G  0 disk 
├─xvda1  202:1    0    7G  0 part /
├─xvda14 202:14   0    4M  0 part 
├─xvda15 202:15   0  106M  0 part /boot/efi
└─xvda16 259:0    0  913M  0 part /boot
```

`sudo apt install cloud-guest-utils`

Grow partition - `sudo growpart /dev/xvda 1`

```
lsblk
NAME     MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
loop0      7:0    0 26.3M  1 loop /snap/amazon-ssm-agent/9881
loop1      7:1    0 73.9M  1 loop /snap/core22/1722
loop2      7:2    0 44.4M  1 loop /snap/snapd/23545
xvda     202:0    0   30G  0 disk 
├─xvda1  202:1    0   29G  0 part /
├─xvda14 202:14   0    4M  0 part 
├─xvda15 202:15   0  106M  0 part /boot/efi
└─xvda16 259:0    0  913M  0 part /boot

```

But the file system is still not updated

```
df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       6.8G  5.1G  1.7G  75% /
tmpfs           3.9G     0  3.9G   0% /dev/shm
tmpfs           1.6G  936K  1.6G   1% /run
tmpfs           5.0M     0  5.0M   0% /run/lock
/dev/xvda16     881M   76M  744M  10% /boot
/dev/xvda15     105M  6.1M   99M   6% /boot/efi
tmpfs           794M   12K  794M   1% /run/user/1000

```

So we need to run - `sudo resize2fs /dev/xdva1`

```
sudo resize2fs /dev/xvda1
resize2fs 1.47.0 (5-Feb-2023)
Filesystem at /dev/xvda1 is mounted on /; on-line resizing required
old_desc_blocks = 1, new_desc_blocks = 4
The filesystem on /dev/xvda1 is now 7601915 (4k) blocks long.
```
We can see now its resized
```
ubuntu@ip-172-31-32-192:~/ultimate-devops-project-demo$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        29G  5.1G   24G  18% /
tmpfs           3.9G     0  3.9G   0% /dev/shm
tmpfs           1.6G  940K  1.6G   1% /run
tmpfs           5.0M     0  5.0M   0% /run/lock
/dev/xvda16     881M   76M  744M  10% /boot
/dev/xvda15     105M  6.1M   99M   6% /boot/efi
tmpfs           794M   12K  794M   1% /run/user/1000
ubuntu@ip-172-31-32-192:~/ultimate-devops-project-demo$ 

```


Now we can again run `docker compose up -d`