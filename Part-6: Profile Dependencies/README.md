# Profile Dependencies
InSpec profiles can bring in the controls from another InSpec profile. These dependencies are maintained in the metadata and captured in the profile's lockfile.

Steps:
- Let's consider we have two profiles viz. ```base_profile``` and ```child_profile``` which has different controls executed by them. 
- If you do not have two profiles, create using ```inspec init profile [profile_name]``` for learning purpose.
- We would like to execute ```child_profile``` which in turns should execute the controls present in the ```base_profile```.
- Add dependency in the metadata of the ```child_profile``` i.e. ```inspec.yml``` as below
  ```
  depends:
    - name: base_profile
      path: ../base_profile
  ```
- Edit the control file of the ```child_profile``` and add the following lines:
  ```
  include_controls 'base_profile'
  ```
  This will include the controls present in the ```base_profile```
- Execute the ```child_profile``` which should execute the controls present in its own control file as well as the ```base_profile``` control file.
  ```
  inspec exec child_profile
  ```

Possible reasons of failure for the ```child_profile``` not being able to execute controls present in the ```base_profile```
- The ```inspec.lock``` file is not updated. To do this delete the file and execute the profile again. Other way to do this without deleting the ```inspec.lock``` file is to use ```--no-create-lockfile``` while executing the profile. Example:  
  ```
  inspec exec child_profile --no-create-lockfile
  ```
- The path to the profile is not set correctly in the ```inspec.yml``` file.

Other ways to add depedency of other profile are as follows: 
- via git:
  ```
    depends:
    - name: base_profile
      git: https://gitrepo/profile
      branch: master
  ```
- via url:
  ```
    depends:
    - name: base_profile
      url: [url]
  ```
- via supermarket:
  ```
    depends:
    - name: base_profile
      supermarket: origin/profile_name
  ```
- via compliance:
  ```
    depends:
    - name: base_profile
      compliance: origin/profile_name
  ```