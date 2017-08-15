# ansible-role-packer-binary

Install `packer` binary from packer.io

## Note for CentOS users

The default installation of CentOS has `/sbin/packer`, linked to
`cracklib-packer`. The `packer` from packer.io is renamed to `packer.io`.

# Requirements

None

# Role Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `packer_binary_version` | version of `packer` | `1.0.4` |
| `packer_binary_base_url` | base URL of remote file | `https://releases.hashicorp.com/packer/{{ packer_binary_version }}` |
| `packer_binary_os_type` | type of OS | `{{ __packer_binary_os_type }}` |
| `packer_binary_arch` | architecture | `amd64` |
| `packer_binary_filename` | remote file name | `packer_{{ packer_binary_version }}_{{ packer_binary_os_type }}_{{ packer_binary_arch }}.zip` |
| `packer_binary_sym_name` | remote file name without extension | `{{ packer_binary_filename | splitext | first }}` |
| `packer_binary_url` | URL of remote file | `{{ packer_binary_base_url }}/{{ packer_binary_filename }}` |
| `packer_binary_dir` | path to directory to install `packer` | `{{ __packer_binary_dir }}` |
| `packer_binary_name` | file name of symlink to `packer` binary | `{{ __packer_binary_name }}` |
| `packer_binary_path` | path to symlink | `{{ packer_binary_dir }}/{{ packer_binary_name }}` |
| `packer_binary_owner` | owner of files and directories | `{{ __packer_binary_owner }}` |
| `packer_binary_group` | group of files and directories| `{{ __packer_binary_group }}` |
| `packer_binary_mode` | mode of `packer` binary | `755` |
| `packer_binary_cache_dir` | path to directory where archives are kept | `{{ __packer_binary_cache_dir }}` |
| `packer_binary_sha256sum` | list of SHA 256 sum of remote files | `{"packer_1.0.4_freebsd_amd64.zip"=>"8c6aebcaf228d6883cd6afda4b88028cd8168fd04d92feb016b7b4a79571d0a2", "packer_1.0.4_linux_amd64.zip"=>"646da085cbcb8c666474d500a44d933df533cf4f1ff286193d67b51372c3c59e", "packer_1.0.4_openbsd_amd64.zip"=>"487ca4f29c327b389370768cb303ade4d791854918d52632be305ac9e614e64f"}` |


## Debian

| Variable | Default |
|----------|---------|
| `__packer_binary_owner` | `root` |
| `__packer_binary_group` | `root` |
| `__packer_binary_name` | `packer` |
| `__packer_binary_dir` | `/usr/bin` |
| `__packer_binary_os_type` | `linux` |
| `__packer_binary_cache_dir` | `/var/cache/packer-binary` |

## FreeBSD

| Variable | Default |
|----------|---------|
| `__packer_binary_owner` | `root` |
| `__packer_binary_group` | `wheel` |
| `__packer_binary_name` | `packer` |
| `__packer_binary_dir` | `/usr/local/bin` |
| `__packer_binary_os_type` | `freebsd` |
| `__packer_binary_cache_dir` | `/var/cache/packer-binary` |

## OpenBSD

| Variable | Default |
|----------|---------|
| `__packer_binary_owner` | `root` |
| `__packer_binary_group` | `wheel` |
| `__packer_binary_name` | `packer` |
| `__packer_binary_dir` | `/usr/local/bin` |
| `__packer_binary_os_type` | `openbsd` |
| `__packer_binary_cache_dir` | `/var/cache/packer-binary` |

## RedHat

| Variable | Default |
|----------|---------|
| `__packer_binary_owner` | `root` |
| `__packer_binary_group` | `root` |
| `__packer_binary_name` | `packer.io` |
| `__packer_binary_dir` | `/usr/bin` |
| `__packer_binary_os_type` | `linux` |
| `__packer_binary_cache_dir` | `/var/cache/packer-binary` |

# Dependencies

None

# Example Playbook

```yaml
- hosts: localhost
  roles:
    - ansible-role-packer-binary
  vars:
```

# License

```
Copyright (c) 2017 Tomoyuki Sakurai <tomoyukis@reallyenglish.com>

Permission to use, copy, modify, and distribute this software for any
purpose with or without fee is hereby granted, provided that the above
copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
```

# Author Information

Tomoyuki Sakurai <tomoyukis@reallyenglish.com>

This README was created by [qansible](https://github.com/trombik/qansible)
