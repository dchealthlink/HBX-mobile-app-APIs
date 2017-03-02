class BaseUtil

  attr_accessor :use_case_directory

  def initialize args={}
    args.each do |k, v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  #
  # Protected
  #
  protected

  def self.url path
    "#{$github_url_prefix}/#{path}"
  end

end