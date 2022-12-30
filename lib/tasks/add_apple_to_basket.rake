task add_apple_to_basket: :environment do
  puts "======Seeding apple table======"
  app_type =  ARGV[1].to_s #first argument is the apple variety
  count =  ARGV[2].to_i #second argument is the apple count
  sql = "select b.id, b.capacity, b.fill_rate from baskets b left join apples a on b.id=a.basket_id where a is null or a.variety='#{ARGV[1]}'"
  results = ActiveRecord::Base.connection.execute(sql)
  if results.count > 0
    tot_count = count
    (1..count).each { |c|
      results.each do |basket|
        app_count = Apple.where(basket_id: basket["id"]).count
        if (basket["capacity"] && app_count < basket["capacity"])
          fil_rate = app_count/basket["capacity"]
          Apple.create(variety: app_type, basket_id: basket["id"])
          Basket.find(basket["id"]).update(fill_rate: fil_rate)
          tot_count = tot_count-1
          break;
        end
      end
    }
    if tot_count!=0
      puts "All baskets are full. We couldn't find the place for #{tot_count} apples"
    end
  else
    puts "All baskets are full. We couldn't find the place for apples"
  end
end