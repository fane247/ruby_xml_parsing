

describe "Bakery Menu" do

	before(:all) do

		@doc = Nokogiri::XML(open("./bakery.xml"))

	end

	it "should contain no items with calories greater than 1000" do

		calories = @doc.css("calories")

		calories.each do |calorie|

			expect(calorie.text.to_i).to be < 1000

		end

	end

	it "should have no price over £8" do


		prices = @doc.css("price")

		prices.each do |price|

			price_value = price.text.gsub('£', '')

			expect(price_value.to_f).to be < 8.0

		end

	end

	it "should have an item called Homestyle Breakfast which is the most expensive item" do

		food_node = @doc.css("food")

		max_price = 0.0

		most_expensive_item = ""

		food_node.each do |food|

			price = food.css("price").text.gsub('£', '').to_f

			if price > max_price

				max_price = price
				most_expensive_item = food.css("name").text

			end	

		end


		expect(most_expensive_item).to eq "Homestyle Breakfast"

	end

	it "should state 2 waffles in description for all waffle items" do


		food_node = @doc.css("food")

		food_node.each do |food|

			if food.css("name").text.include? "Waffle"

				includes_waffle = food.css("description").text.include? "Waffle"
				include_two = food.css("description").text.include? "two"

				expect(includes_waffle && include_two).to be true

			end 


		end




	end

end