# Chrony speedup

Config file should be:

```
pool pool.ntp.org iburst
driftfile /var/lib/chrony/drift
makestep 1 3
rtcsync
```
