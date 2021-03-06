# Copyright 2016-2019 Shine Solutions
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

Puppet::Type.newtype(:aem_flush_agent) do
  ensurable

  def self.title_patterns
    [[/^(.*)$/, [[:name, ->(x) { x }]]]]
  end

  newparam :name do
    isnamevar
    desc 'AEM flush agent name'
    validate do |value|
      raise ArgumentError.new('Flush agent name must be provided') if value == ''
    end
  end

  newparam :aem_id do
    isnamevar
    desc 'AEM instance ID'
  end

  newparam :aem_username do
    desc 'AEM username'
  end

  newparam :aem_password do
    desc 'AEM password'
  end

  newparam :run_mode do
    desc 'AEM run mode where the flush agent is'
    validate do |value|
      raise ArgumentError.new('run_mode should be author or publish') unless %w[author publish].include? value
    end
  end

  newparam :title do
    desc 'AEM flush agent title'
  end

  newparam :description do
    desc 'AEM flush agent description'
  end

  newparam :dest_base_url do
    desc 'AEM flush agent destination base URL'
  end

  newparam :log_level do
    desc 'AEM flush agent log level'
    validate do |value|
      value = nil if value == ''
    end
  end

  newparam :retry_delay do
    desc 'AEM flush agent retry delay in milliseconds'
    validate do |value|
      value = nil if value == ''
    end
  end

  newparam :force do
    desc 'Set to true to force flush agent to be created if it doesn\'t exist or updated if it already exists'
    validate do |value|
      value = false if value == ''
    end
  end
end
