
# ![](https://s.gravatar.com/avatar/62c4c783c4d7233c73f3a114578df650.jpg?s=50) Chaperone

---

## NOTICE
The following section is an exact copy of the original author's words. They are not the words of Logan Wood and should not be treated as such.

---

Chaperone is a lean init-style startup manager for Docker-like containers.  It runs as a single lightweight full-featured process which runs at the root of a docker container tree and provides all of the following functionality, plus much more:

* Monitoring for all processes in the container, automatically shutting down the
  container when the last process exits.
* A complete, configurable syslog facility built in and provided on /dev/log
  so daemons and other services can have output captured.  Configurable
  to handle log-file rotation, duplication to stdout/stderr, and full Linux
  logging facility, severity support.  No syslog daemon is required in your
  container.
* The ability to start up system services in dependency order, with options
  for per-service environment variables, restart options, and stdout/stderr capture either
  to the log service or stdout.
* A built-in cron scheduling service.
* Emulation of systemd notifications (sd_notify) so services can post
  ready and status notifications to chaperone.
* Process monitoring and zombie elimination, along with organized system
  shutdown to assure all daemons shut-down gracefully.
* The ability to have an optional controlling process, specified on the 
  docker command line, to simplify creating containers which have development
  mode vs. production mode.
* Complete configuration using a ``chaperone.d`` directory which can be located
  in various places, and even allows different configurations
  within the container, triggered based upon which user is selected at start-up.
* Default behavior designed out-of-the-box to work with simple Docker containers
  for quick start-up for lean containers.
* More...

If you want to try it out quickly, the best place to start is on the
[chaperone-docker](https://github.com/garywiz/chaperone-docker) repository
page.  There is a quick section called "Try it out" that uses images
available now on Docker Hub.

For full details of features
and usage: [see the documentation](http://garywiz.github.io/chaperone/index.html).

There is some debate about whether docker containers should be transformed into
complete systems (so-called "fat containers").  However, it is clear that many
containers contain one or more services to provide a single "composite feature",
but that such containers need a special, more streamlined approach to managing
a number of common daemons.  

Chaperone is the best answer I've come up with so far, and was inspired by
The [Phusion baseimage-docker](http://phusion.github.io/baseimage-docker/) approach.
However, unlike the Phusion image, it does not require adding daemons for logging,
system services (such as runit).  Chaperone is designed to be self-contained.

Status
------

This fork of Chaperone has been modified from the original. This software does not feature any warranties and may not be production-ready. USE AT YOUR OWN RISK.

Downloading and Installing
--------------------------

The easiest way to install `chaperone`` is using ``pip``:

    # Ubuntu or debian prerequisites...
    apt-get install python3-pip git

    # chaperone installation (may be all you need)
    python3 -m pip install git+https://github.com/loganwoodxyz/chaperone.git

License
-------

Copyright (c) 2015, Gary J. Wisniewski <garyw@blueseastech.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
