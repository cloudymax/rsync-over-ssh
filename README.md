# rsync-over-ssh

Faster file transfers by running rsync over ssh. Based on this wild thread: https://gist.github.com/KartikTalwar/4393116.

## Results

Local pc to pc transfer over gigabit network

```bash
sending incremental file list
delta-transmission enabled
<f+++++++++ test-image.tif
          2.47G 100%  199.49MB/s    0:00:12 (xfr#1, to-chk=0/1)
total: matches=0  hash_hits=0  false_alarms=0 data=2652417088

sent 1.14G bytes  received 66 bytes  86.65M bytes/sec
total size is 2.47G  speedup is 2.16
```
