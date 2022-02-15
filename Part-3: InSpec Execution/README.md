# InSpec Execution
- InSpec enables you to execute controls that you define
  - locally, in a control file or profile
    - ```inspec exec [control_file_name.rb]```
    - ```inspec exec [profile_directory_name]```
  - remotely, in a profile stored at a URL
    - ```inspec exec [URL]```
  - remotely, through the Chef Supermarket
    - ```inspec supermarket exec [profile_name]```
  - remotely, through Chef Compliance
    - ```inspec compliance exec [profile_name]```

- To see list of profiles available on the supermarket
  - ```inspec supermarket profiles```
- To see list of profiles available on the compliance
  - ```inspec compliance profiles```
- Some controls may require root privileges, in such situation add the sudo flag while executing the profile
  - ```inspec exec [profile] -t [target] --sudo```
- To execute multiple profiles:
  - ```inspec exec [profile_1_name] [profile_2_name]```