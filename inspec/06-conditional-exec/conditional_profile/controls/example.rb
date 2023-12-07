# copyright: 2018, The Authors
title "Conditional Execution"

# you can also use plain tests
describe file("/tmp") do
  it { should be_directory }
end

# you add controls here
control "tmp-1.0" do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title "Testing Command on Conditional Execution with if"             # A human-readable title
  my_cmd = 'git --version'
  my_op = 'git version 2.25.1'
  if os.families[0].eql?('redhat')
    my_cmd = 'cat /hello.txt'
    my_op = 'Conditional Test'
  end
  describe command("#{my_cmd}") do 
    its('stdout') {should match "#{my_op}"}
  end
end

# you add controls here
control "tmp-2.0" do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title "Testing Command on Conditional Execution with describe.one"             # A human-readable title
  describe.one do 
    describe command("cat /hello.txt") do 
      its('stdout') {should match "Conditional Test"}
    end

    describe command("git --version") do 
      its('stdout') {should match "git version 2.25.1"}
    end
  end
end

# you add controls here
control "tmp-3.0" do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title "Testing Command on Conditional Execution with only_if"             # A human-readable title
  
  only_if do 
    file('/hello.txt').exist? 
  end

  describe command("cat /hello.txt") do 
    its('stdout') {should match "Conditional Test"}
  end
end
