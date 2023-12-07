# InSpec Shell
- An interactive session that enables you to explore InSpec resources and controls on:
  - Your local workstation
  - A remote target
  - A local docker container
  - A cloud provider

- To launch the session locally:
  ```inspec shell ```
- To see the resources InSpec provides:
  ```help resources```
- To launch the session on an instance:
  - ```inspec shell -t ssh://user:password@host```
  - ```inspec shell -t winrm://user:password@host```
  - ```inspec shell -t docker://container_id```
  - ```inspec shell -t cloud://region-subscription```

