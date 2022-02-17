# Anatomy of Controls
InSpec expresses expectations about the state of the target system through resources expressed as controls.
- **resources** with defaults, required, optional parameters, and filters.
- **individual tests** with properties, conditions, matchers, and expected results.

## Resources
InSpec resources map platform concepts to code objects
- default value
- required parameters
- optional parameters
- resources with filters

Example of a resource:

- ```http("https://docs.chef.io/").status```
- ```user.username```

## Controls
InSpec controls express expectations about the state of the resources on our system. 
- properties
- conditions
- matchers
- expected results

## Sample Control
```
describe package('git) do
    it { should be_installed }
    its('version) { should cmp '1.8' }
end
```

## Components of Controls
Controls has 
- Properties like: ```baseurl, version, status```
- Conditions like ```should, should_not```
- Matchers like: ```exist, eq, be_installed, cmp```
- Expected results: the result we expect

## Anatomy of Controls
```
describe resource('name', param: value) do
    it { should exist }
    it { should_not be_nil }
end

describe resources('name').where { ... } do
    its('property') { should cmp expected }
end
```
