## Tudas

**Work in progress.**

Tudas is a simple minimalist command runner requiring no installation and no dependencies beyond basic Unix commands. Features and syntax inspired by [makesure][makesure], implementation inspired by [Taskfile][taskfile].

## Design Goals

* **Auditable:**
    * Fit all logic in a single script.
    * Avoid dependencies besides what is already found on a typical Unix OS.
    * Allow a reasonably experienced developer to understand the code in an afternoon.
* **No installation:** Include the script in your code repository so developers don't have to download or install anything.
* **Worse is better:** It doesn't need to be perfect; it just needs to work well and avoid footguns.
* **Simple to use:**
    * Target audience is developers or sysadmins who can write basic shell scripts.
    * The `Tudasfile` should be simple to understand without going to look up documentation.
    * A new `Tudasfile` should be simple to write from scratch after a few minutes with this README.

## Hello World

Add the `tudas` script to your Git repository. Then create a `Tudasfile` that looks like this:

```bash
@goal default
@depends_on cowsay_installed
    cowsay "Hello, world!"

@goal cowsay_installed
@reached_if command -v cowsay &> /dev/null
    # I'm writing this on Fedora, so we use `dnf` here:
    sudo dnf install --assumeyes cowsay
```

Now when you run `./tudas` you should see:

```plaintext
goal "cowsay_installed"...

[lots of dnf output here]

Installed:
  cowsay-3.04-17.fc35.noarch

Complete!
goal "cowsay_installed": [success]
goal "default"...
 _______________
< Hello, world! >
 ---------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
goal "default": [success]
```

The next time you run `./tudas`, you should only see this:

```plaintext
goal "cowsay_installed": [already satisfied]
goal "default"...
 _______________
< Hello, world! >
 ---------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
goal "default": [success]
```

A more complete real-world usage can be found in my partner's [laptop configuration repository][wife-lappy]. I personally use this for configuring workstations, however I intend to also use this for server configuration (think "poor man's Ansible") and hobby code projects (replacing things like `make install` etc).

[makesure]: https://github.com/xonixx/makesure
[taskfile]: https://github.com/adriancooney/Taskfile
[wife-lappy]: https://github.com/pcrockett/wife-laptop
