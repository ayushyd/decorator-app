json.array!@articles do |article|
	json.partial! 'articles/article', article: article

	json.category do 
		json.partial! 'categories/category', category: article.category
	end
    
    json.source do 
    	json.partial! 'sources/source', source: article.source
    end
end