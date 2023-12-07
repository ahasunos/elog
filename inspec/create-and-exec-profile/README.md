# Create a Profile
InSpec Profiles organize multiple controls into a reusable artifact that can be described and versionsed

- To create a Profile:
  - ```inspec init profile [profile_name]```
  - exmaple: ```inspec init profile my_profile```
- To check if an instance exist
  - ```inspec detect -t [target_instance]```
  - example: ```inspec detect -t docker://[container_id]```
- To load the profile on the target
  - ```inspec exec -t [target_instance] [profile_name]```
  - example: ```inspec exec -t docker://[container_id] my_profile```