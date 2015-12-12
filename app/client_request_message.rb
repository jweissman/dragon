module Dragon
  class ClientRequestMessage
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def whitelist
      %w[ name race subtype age gender profession ]
    end

    def hydrate(command)
      whitelist.each do |attribute|
        if params.has_key?(attribute)
          value = params[attribute]
          puts "---> Augmenting command with #{attribute} == #{value}"
          begin
            command.send :"#{attribute}=", value
          rescue NameError
            # ignore..
            puts "[warning] attempting to augment command #{command.class.name} with #{attribute}"
          end
        end
      end
    end

    def has_whitelisted_keys?
      whitelist.any? do |key|
        find_record_with_name(key)
      end
    end

    def params
      @params ||= extract_params
    end

    def extract_params
      ps = {}
      if has_whitelisted_keys?
        whitelist.each do |attribute|
          value = extract_attribute_from_record(attribute)
          ps[attribute] = value
        end
      end

      if profession_record
        ps['profession'] = profession.new
      end

      ps
    end

    def profession
      name = profession_record['value']
      find_adventuring_profession_with_name(name)
    end

    def find_adventuring_profession_with_name(name)
      Profession.adventuring.detect do |p|
        p.new.type == name
      end
    end

    def profession_record
      find_record_with_name('profession')
    end

    def action
      extract_attribute_from_record('action')
    end

    def action_record
      find_record_with_name('action')
    end

    def extract_attribute_from_record(attr)
      find_record_with_name(attr)['value']
    end

    def find_record_with_name(name)
      data.detect { |r| r['name'] == name }
    end
  end
end
