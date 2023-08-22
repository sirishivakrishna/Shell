### Attach EBS Volume to Running instance

**NOTE**
-->EBS volume should be in same Availbility Zone where your instance Running..

Steps:
--->By default you can't see the volume in Linux erver, we need to do some configuration

#We can check the voulmes availability by using below command

lsblk

Create FileSystem from Volume

sudo mkfs -t xfs /dev/xvdf


