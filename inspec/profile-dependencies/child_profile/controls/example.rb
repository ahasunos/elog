# copyright: 2018, The Authors
include_controls 'base_profile'
title "sample section"

# Checks if the README file is present in child_profile
describe file("../README.md") do
  it { should exist }
end

# you add controls here
control "tmp-1.0" do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  title "Create /tmp directory"             # A human-readable title
  desc "An optional description..."
  describe file("/tmp") do                  # The actual test
    it { should be_directory }
  end
end
