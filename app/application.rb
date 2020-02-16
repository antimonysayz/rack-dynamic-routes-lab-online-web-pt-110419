class application
  @@items = []

  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.match(/items\/.+/)
      item_name = req.path.split("/items/").last

      item = @@items.collect {|i| i.name == item_name}
      if item
        resp.write item.price
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not Found"
      resp.status = 404
    end
    resp.finsh
  end
end
