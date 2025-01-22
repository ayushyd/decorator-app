json.array!@sources do |source|
	json.partial! 'sources/source', source: source
end