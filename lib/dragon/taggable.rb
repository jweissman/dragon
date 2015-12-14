module Dragon
  module Taggable
    def tagged(*syms)
      @tags = syms
    end

    def tagged_with?(tag)
      tags.include?(tag) || 
        (superclass.respond_to?(:tagged_with?) && superclass.tagged_with?(tag))
    end

    def tags
      @tags ||= []
    end
  end
end
