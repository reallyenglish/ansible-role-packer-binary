require "spec_helper"
require "serverspec"

version = "1.0.4"
dir = "/usr/bin"
symlink_name = "packer"
cache_dir = "/var/cache/packer-binary"
os_type = "linux"
default_user = "root"
default_group = "root"
mode = 755

case os[:family]
when "redhat"
  symlink_name = "packer.io"
when "openbsd"
  os_type = "openbsd"
  default_group = "wheel"
  dir = "/usr/local/bin"
when "freebsd"
  os_type = "freebsd"
  default_group = "wheel"
  dir = "/usr/local/bin"
end
filename = "packer_#{version}_#{os_type}_amd64"
owner = default_user
group = default_group

describe file(cache_dir) do
  it { should exist }
  it { should be_directory }
  it { should be_owned_by default_user }
  it { should be_grouped_into default_group }
  it { should be_mode 755 }
end

describe file("#{cache_dir}/#{filename}.zip") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by default_user }
  it { should be_grouped_into default_group }
  it { should be_mode 644 }
end

describe file("#{dir}/#{symlink_name}") do
  it { should exist }
  it { should be_symlink }
  it { should be_linked_to "#{dir}/#{filename}/packer" }
end

describe file("#{dir}/#{filename}/packer") do
  it { should exist }
  it { should be_file }
  it { should be_owned_by owner }
  it { should be_grouped_into group }
  it { should be_mode mode }
end

# Packer v1.0.4
describe command("#{symlink_name} version") do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match(/^Packer v#{Regexp.escape(version)}$/) }
  its(:stderr) { should eq "" }
end
