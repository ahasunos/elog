# Conditional Execution
InSpec controls can be conditionally executed based on additional requirements expressed through InSpec helpers and language constructs.

## Profile Attributes:
- only_if
  ```
  only_if do
      command('git').exist?
  end
  ```
- if
  ```
  if os.linux?
    ...
  end
  ```
- describe.one
  ```
  describe.one do
    describe file('primary.cfg) do
        its('content') { ... }
    end

    describe file('seconday.cfg) do
        its('content') { ... }
    end
  end
  ```
- supports
  ```
  supports:
    os-family: OSFAMILY
  ```

## My Activity
For this activity I have two docker instances running, a CentOS and a Ubuntu image. The Ubuntu instance has ```git``` installed, and in the CentOS instance I have created a file ```hello.txt``` in the root directory with a content of "Conditional test" inside of it.

- Execution on CentOS
  ```
  inspec exec conditional_profile -t docker://86b8cd0c449f --no-create-lockfile
  ```
  Output:
  ```
  WARNING: Nokogiri was built against libxml version 2.9.4, but has dynamically loaded 2.9.10

  Profile: InSpec Profile (conditional_profile)
  Version: 0.1.0
  Target:  docker://86b8cd0c449fca335313a635461801e1a5c82cf58ec5a71e53ecbbda6a856381

    ✔  tmp-1.0: Testing Command on Conditional Execution with if
       ✔  Command: `cat /hello.txt` stdout is expected to match "Conditional Test"
    ✔  tmp-2.0: Testing Command on Conditional Execution with describe.one
       ✔  Command: `cat /hello.txt` stdout is expected to match "Conditional Test"
    ✔  tmp-3.0: Testing Command on Conditional Execution with only_if
       ✔  Command: `cat /hello.txt` stdout is expected to match "Conditional Test"

    File /tmp
       ✔  is expected to be directory

  Profile Summary: 3 successful controls, 0 control failures, 0 controls skipped
  Test Summary: 4 successful, 0 failures, 0 skipped
  ```

- Execution on Ubuntu:
  ```
  inspec exec conditional_profile -t docker://2d31e0883f76 --no-create-lockfile
  ```
  Output:
  ```
  WARNING: Nokogiri was built against libxml version 2.9.4, but has dynamically loaded 2.9.10

  Profile: InSpec Profile (conditional_profile)
  Version: 0.1.0
  Target:  docker://2d31e0883f76ba10891bc9ca5f8bad99ad1291b49fa6b84ff728e34bf189869c

    ✔  tmp-1.0: Testing Command on Conditional Execution with if
       ✔  Command: `git --version` stdout is expected to match "git version 2.25.1"
    ✔  tmp-2.0: Testing Command on Conditional Execution with describe.one
       ✔  Command: `git --version` stdout is expected to match "git version 2.25.1"
    ↺  tmp-3.0: Testing Command on Conditional Execution with only_if
       ↺  Skipped control due to only_if condition.

    File /tmp
       ✔  is expected to be directory

  Profile Summary: 2 successful controls, 0 control failures, 1 control skipped
  Test Summary: 3 successful, 0 failures, 1 skipped
  ```
- When I change supports os-family to windows in the ```inspec.yml``` file and execute on the linux instances i.e. Ubuntu & CentOS in my case. My inspec.yml file looked like this:
  ```
  name: conditional_profile
  title: InSpec Profile
  maintainer: The Authors
  copyright: The Authors
  copyright_email: you@example.com
  license: Apache-2.0
  summary: An InSpec Compliance Profile
  version: 0.1.0
  supports:
    platform: os
    os-family: windows
  ```
  Execute:
  ```
  inspec exec conditional_profile -t docker://2d31e0883f76 --no-create-lockfile
  ```
  Output:
  ```
  WARNING: Nokogiri was built against libxml version 2.9.4, but has dynamically loaded 2.9.10
  Skipping profile: 'conditional_profile' on unsupported platform: 'ubuntu/20.04'.

  Test Summary: 0 successful, 0 failures, 0 skipped
  ```