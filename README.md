# Sodium 
===============

A semi-custom build of Fedora Kinoite trying to gain the perfect balance between performance and security.

Generated using the [UBlue Image Template](https://github.com/ublue-os/image-template).

Check out the two projects most of this  configuration sources itself from!
[secureblue](https://github.com/secureblue/secureblue), [bluevanilla](https://github.com/aguslr/bluevanilla).

# Installation

## Rebasing

- First you must rebase to the unsigned image, to get the keys installed:
  
  ``` rpm-ostree rebase ostree-unverified-registry:ghcr.io/quelln/sodium:latest && systemctl reboot```

- Now you can rebase to the signed image:

  ``` rpm-ostree rebase ostree-image-signed:docker://ghcr.io/quelln/sodium:latest && systemctl reboot```

  ## Post Install
  It is recommended that you use these parameters
  
  ```rpm-ostree kargs --append="tsc=reliable,cryptomgr.notests intel_iommu=igfx_off kvm-intel.nested=1 no_timer_check noreplace-smp page_alloc.shuffle=1 rcupdate.rcu_expedited=1 rw"```
 
  `tsc=reliable` => skip all the TSC stability checks during boot time.
  
  `cryptomgr.notests` => disables crypto self tests.
  
  `intel_iommu=igfx_off` => Using the "igfx_off" parameter allows the GPU to access the physical memory directly without going through the DMAR (DMA Remapping), only affects virtualization.
  
  `kvm-intel.nested` => enables KVM nesting.
  
  `no_timer_check` => Disables the code which tests for broken timer IRQ sources.
  
  `noreplace-smp` => Don't replace SMP instructions with UP alternatives.
  
  `page_alloc.shuffle=1` => Controls whether the page allocator should randomize  its free lists, good for performance.
  
  `rcupdate.rcu_expedited=1` =>  Use expedited grace-period primitives, for example, synchronize_rcu_expedited() instead of synchronize_rcu().  This reduces latency, but can increase CPU utilization, degrade real-time latency, and degrade energy efficiency.
  
  `rw` => Mount filesystem as read-write.

   These parameters are taken from the [Clear Linux](https://www.clearlinux.org/) project.
   You can read more about these parameters from [here](https://www.kernel.org/doc/html/v6.1/admin-guide/kernel-parameters.html).
