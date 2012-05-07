class MenuNode
  attr_accessor :name, :children

  def initialize(name = nil, options = {}, &block)
    @name     = name
    @options  = options
    @children = []

    block.call self if block_given?
  end

  # If we don't have a URL specified, use the first child URL
  def url
    @options[:url] || children.first.url
  end

  def has_url?
    @options[:url].present?
  end

  def icon
    @options[:icon]
  end

  def add(name, options = {}, &block)
    MenuNode.new(name, options.merge(parent: self), &block).tap do |node|
      @children << node
    end
  end

  def parent
    @options[:parent]
  end

  def path_to_root
    @path_to_root ||=
      if parent.present?
        [self, parent.path_to_root].flatten
      else
        []
      end

  end

  def to_s
    "'#{name}' => '#{url}'"
  end

  def flatten
    [self, children.find_all(&:has_url?).collect(&:flatten)].flatten
  end
end
