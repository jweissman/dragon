module Dragon
  module Taggable
    def tagged(*syms)
      @tags ||= []
      @tags << syms
      @tags.flatten!.uniq!
    end

    def tagged_with?(tag)
      tags.include?(tag) ||
        (superclass.respond_to?(:tagged_with?) && superclass.tagged_with?(tag))
    end

    def tags
      @tags ||= []
      (@tags + (superclass.tags rescue [])) #.flatten.uniq
    end
  end
end
