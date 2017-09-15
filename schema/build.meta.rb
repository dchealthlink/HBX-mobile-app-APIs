#! /usr/bin/env ruby

require 'json'

def build_options options
	lines = options.split '|' 
	lines.map do |option| 
				name, value = option.split ':'
				if name && value
					{ name: unescape_commas(name), value: value}
				else 
					{ name: 'hardwired', value: name}
				end 
		      end unless options.empty? 
end

def build_prereq_values prereq_values
	prereq_values.chomp.split('|') unless prereq_values.empty?  
end

def escape_commas line
	chars = line.split ''
	inQuotes, result = false, ""
	chars.inject(result) do |result,c| 
		inQuotes = !inQuotes if c == "\""
		result += (inQuotes && c == ",") ? "ß" : c 
	end
end

def unescape_commas word
	word.gsub "ß", ","
end

def dependent_fields_of prereq_field, entityFields, dependency_level
	#print ">>> dependent_fields_of #{prereq_field}, #{entityFields.count}, #{dependency_level}\n"
	entityFields.select do |f| 
		f[:prereq_field] == prereq_field 
	end.map do |f|
		elaborated(f).tap do |f|
			f[:dependency_level] = dependency_level
			f[:dependent_fields] = dependent_fields_of f[:field], entityFields, (dependency_level + 1)
		end
	end
end

def root_fields_of entityFields
	dependent_fields_of '', entityFields, 0
end 

def elaborated field
	f = field.clone
	#print ">>> looking at field of type #{field[:type]}\n"
	if field[:type] =~ /(.*)Section/
		subEntity = $1.capitalize
		#print ">>> found section #{subEntity} \n"
		f[:type] = "section"
		f[:field] = subEntity
		f[:subFields] = fields_of subEntity
	    f
	else
		f
	end
end

def fields_of entity
	#print ">>> fields of #{entity}:\n"
	entityFields = @meta[entity]
	abort "no entry found for #{entity}\n" unless entityFields
	root_fields_of(entityFields).map { |field| elaborated field }
end

if ARGV[0] == '-d'
	ARGV.shift
	demo_mode = true
end

if ARGV[0] == '--uqhp-only'
	ARGV.shift
	uqhp_only = true
end

@meta = {}
ARGF.drop(1).each do |line|
   unless line =~ /^\#/
    entity,field,label,type,options,prereq_field,prereq_values,summary_element_order,mobile_only,target,maxlength,default_value,readonly,optional = escape_commas(line).split(',').map {|w| w.gsub "\"", ""}
	entity.capitalize!
	@meta[entity] ||= []
	abort "label missing in #{line}" unless label

	existing_field = @meta[entity].detect {|f| f[:field] == prereq_field }
	if existing_field then
		abort ">> in field #{existing_field}\n ERROR: illegal prereq_field type \nfield #{existing_field[:field]} of type #{existing_field[:type]} cannot be a prereq_field of #{field}, the type is not legal for prereq_fields\n" unless ["dropdown", "yesnoradio"].include? existing_field[:type]
	end

	valid_targets = uqhp_only ? ['both', 'uqhp'] : ['both', 'haven']

	@meta[entity] << {
		field: field,
		label: unescape_commas(label),
		type: type,
		options: build_options(options || ''),
		prereq_field: prereq_field,
		prereq_values: build_prereq_values(prereq_values || ''),
		summary_element_order: summary_element_order == '' ? nil : summary_element_order.to_i, 
		mobile_only: mobile_only == "" ? nil : mobile_only, 
		maxlength: maxlength == "" ? nil : maxlength.to_i,
		default_value: default_value == "" ? nil : default_value,
		readonly: readonly == "" ? "N" : readonly,
		optional: optional == "" ? "N" : optional
	} if valid_targets.include? target
   end
end

output = { :Person =>        fields_of('Person'),
           :Relationship =>  fields_of('Relationship'),
           :Attestation  =>  fields_of('Attestation')
         }

print JSON.pretty_generate (demo_mode ? @meta : output)
