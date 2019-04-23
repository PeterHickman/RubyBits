require 'yaml'
require 'open-uri'

# Loads a YAML based configuration file and allows access to the
# contents via the get method. For example:
#
# -- config.yml
# db:
#   user: the_user
#   pass: the_password
#
# cf = ConfigFile.new('config.yml')
# cf.get('db:user') => the_user
# cf.get('db')      => { user: the_user, pass: the_password }
#
# Undefined keys return nil. The keys are assumed to be strings
# and not symbols
#
# If the file is updated then it will reload when you next call
# the get method

class ConfigFile
  def initialize(filename)
    @filename = filename

    @data = {}

    @mtime = File.mtime(@filename)

    loadfile
  end

  def get(path)
    new_mtime = File.mtime(@filename)
    if new_mtime != @mtime
      loadfile
      @mtime = new_mtime
    end

    parts = path.split(':')

    x = @data.dup

    parts.each do |part|
      x = x[part]
    end

    x
  end

  private

  def loadfile
    yaml = open(@filename).read
    @data = YAML.load(yaml)
  end
end

