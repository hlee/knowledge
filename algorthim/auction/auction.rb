module Auction
  class Item
    attr_accessor :name, :reserved_price, :status, :sold_price, :bid_list, :current_win
    def initialize(name, reserved_price)
      self.name = name
      self.reserved_price = reserved_price
      self.status = 'ready'
    end
  end

  class Auction
    attr_accessor :ready_items, :sold_items
    def initialize(items)
      return 'include sold item' if items.status == 'sold'
      self.ready_items = items
    end

    def start_bid(item, bid)
      return 'fail bid' if !self.items.include?(item) || bid.price <= self.current_win.price
      item.current_win = bid
      item.bid_list << bid
      if bid.price > item.reserved_price
        item.status = 'sold'
        item.sold_price = bid.price
      end
    end
  end

  class Bid
    attr_accessor :bidder_name, :price
    def initialize(name, price)
      self.bidder_name = name
      self.price = price
    end
  end
end