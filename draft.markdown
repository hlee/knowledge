```ruby
Product.update_all({discontinued: true}, {id: params[:product_ids]})
```

two hash, first to be updated, second is the query
