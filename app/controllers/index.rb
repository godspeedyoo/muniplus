get '/' do
  erb :index
end

post '/routes' do
  @route = Muni::Route.find(params[:route_number])
  @predictions = @route.outbound.stop_at("2nd st & Folsom").predictions
  r = jsonify(@route)
  @route = RouteAccessor::Route.new(r)
  binding.pry
  # @route.list_inbound_stops
  # RouteAccessor::Route.new(@route)
  erb :index
end
# r12 = Muni::Route.new({
#   tag: "3008",
#   title: "2nd St & Folsom St",
#   lat: "37.7853199",
#   lon: "-122.39656",
#   stopId: "37.7853199",
#   route_tag: "12",
#   direction: "12_OB1"
# })


# Ways to access a route that has been JSONified and parsed
# y = JSON.parse(@route.to_json)
# -----------INBOUND------------------
# y["table"]["directions"][0]["table"]
# -----------OUTBOUND-----------------
# y["table"]["directions"][0]["table"]

# STOPS
# y["table"]["directions"][0]["table"]["stops"]
# Displays the Stop ID and Title as a list
  # y["table"]["directions"][0]["table"]["stops"].each do |stop|
  #   puts "Stop #: #{stop["table"]["tag"]} Title: #{stop["table"]["title"]}"
  # end


#



# r12 = Muni::Route.find(12)
# p r12.outbound.stop_at("2nd St & Folsom St").predictions
# ---------------------------------------------------------
# sample of entire route
# Muni::Route.find(12)
# will return...
#<Muni::Route tag="12", title="12-Folsom/Pacific", directions=[#<Muni::Direction id="12_IB1", name="Inbound to Jackson & Van Ness", stops=[#<Muni::Stop tag="3476", title="24th St & Mission St", lat="37.7523199", lon="-122.41833", stopId="37.7523199", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="6877", title="Valencia St & 24th St", lat="37.75186", lon="-122.4207399", stopId="37.75186", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="6879", title="Valencia St & 25th St", lat="37.75028", lon="-122.42059", stopId="37.75028", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="7592", title="Cesar Chavez St & Valencia St", lat="37.74806", lon="-122.42006", stopId="37.74806", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="7551", title="Cesar Chavez St & Mission St", lat="37.7481", lon="-122.4180799", stopId="37.7481", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="7552", title="Folsom St & Cesar Chavez St", lat="37.7483799", lon="-122.41358", stopId="37.7483799", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="4681", title="Folsom St & 25th St", lat="37.7508299", lon="-122.4138399", stopId="37.7508299", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="4677", title="Folsom St & 24th St", lat="37.7527599", lon="-122.41402", stopId="37.7527599", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="4675", title="Folsom St & 22nd St", lat="37.75595", lon="-122.41433", stopId="37.75595", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="7733", title="Folsom St & 20th St", lat="37.75899", lon="-122.41462", stopId="37.75899", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="4671", title="Folsom St & 18th St", lat="37.76222", lon="-122.41491", stopId="37.76222", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="4668", title="Folsom St & 16th St", lat="37.76557", lon="-122.41524", stopId="37.76557", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="4667", title="Folsom St & 14th St", lat="37.76846", lon="-122.41553", stopId="37.76846", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="4664", title="Folsom St & 11th St", lat="37.7719899", lon="-122.41373", stopId="37.7719899", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="4663", title="Folsom St & 9th St", lat="37.77389", lon="-122.4113199", stopId="37.77389", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="4662", title="Folsom St & 8th St", lat="37.7751199", lon="-122.40977", stopId="37.7751199", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="4661", title="Folsom St & 7th St", lat="37.77664", lon="-122.4078499", stopId="37.77664", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="4660", title="Folsom St & 6th St", lat="37.7786299", lon="-122.40532", stopId="37.7786299", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="4659", title="Folsom St & 5th St", lat="37.78039", lon="-122.4030999", stopId="37.78039", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="4658", title="Folsom St & 4th St", lat="37.7821499", lon="-122.40086", stopId="37.7821499", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="4657", title="Folsom St & 3rd St", lat="37.78399", lon="-122.3987499", stopId="37.78399", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="7548", title="2nd St & Howard St", lat="37.7867599", lon="-122.3981399", stopId="37.7867599", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="7549", title="2nd St & Stevenson St", lat="37.7882799", lon="-122.4000699", stopId="37.7882799", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="7550", title="Sansome St & Sutter St", lat="37.7903499", lon="-122.4005", stopId="37.7903499", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="6332", title="Sansome St & Pine St", lat="37.7920199", lon="-122.4008599", stopId="37.7920199", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="6333", title="Sansome St & Sacramento St", lat="37.7942799", lon="-122.40131", stopId="37.7942799", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="6337", title="Sansome St & Washington St", lat="37.7960599", lon="-122.4016599", stopId="37.7960599", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="5854", title="Pacific Ave & Sansome St", lat="37.7975399", lon="-122.4023699", stopId="37.7975399", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="5849", title="Pacific Ave & Montgomery St", lat="37.7973899", lon="-122.40358", stopId="37.7973899", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="5842", title="Pacific Ave & Kearny St", lat="37.7971699", lon="-122.40522", stopId="37.7971699", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="5837", title="Pacific Ave & Grant Ave", lat="37.7969799", lon="-122.40673", stopId="37.7969799", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="7737", title="Pacific Ave & Stockton St", lat="37.79673", lon="-122.4085799", stopId="37.79673", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="5852", title="Pacific Ave & Powell St", lat="37.7965599", lon="-122.40999", stopId="37.7965599", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="5847", title="Pacific Ave & Mason St", lat="37.79638", lon="-122.4116199", stopId="37.79638", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="5856", title="Pacific Ave & Taylor St", lat="37.7961699", lon="-122.41327", stopId="37.7961699", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="5840", title="Pacific Ave & Jones St", lat="37.7959599", lon="-122.41491", stopId="37.7959599", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="5845", title="Pacific Ave & Leavenworth St", lat="37.7957599", lon="-122.41655", stopId="37.7957599", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="5838", title="Pacific Ave & Hyde St", lat="37.79555", lon="-122.4181999", stopId="37.79555", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="5843", title="Pacific Ave & Larkin St", lat="37.7953299", lon="-122.41986", stopId="37.7953299", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="5850", title="Pacific Ave & Polk St", lat="37.7951099", lon="-122.42148", stopId="37.7951099", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="7203", title="Jackson St & Polk St", lat="37.7941799", lon="-122.4217299", stopId="37.7941799", route_tag="12", direction="12_IB1">, #<Muni::Stop tag="35859", title="Pacific Ave & Van Ness Ave", lat="37.7947799", lon="-122.4229", stopId="37.7947799", route_tag="12", direction="12_IB1">]>, #<Muni::Direction id="12_OB1", name="Outbound to the Mission District", stops=[#<Muni::Stop tag="5859", title="Pacific Ave & Van Ness Ave", lat="37.7947799", lon="-122.4229", stopId="37.7947799", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="5851", title="Pacific Ave & Polk St", lat="37.795", lon="-122.4212499", stopId="37.795", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="5844", title="Pacific Ave & Larkin St", lat="37.79515", lon="-122.4200299", stopId="37.79515", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="5839", title="Pacific Ave & Hyde St", lat="37.79538", lon="-122.4183899", stopId="37.79538", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="5846", title="Pacific Ave & Leavenworth St", lat="37.79559", lon="-122.4167399", stopId="37.79559", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="5841", title="Pacific Ave & Jones St", lat="37.7957899", lon="-122.4151", stopId="37.7957899", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="5857", title="Pacific Ave & Taylor St", lat="37.7959999", lon="-122.41346", stopId="37.7959999", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="5848", title="Pacific Ave & Mason St", lat="37.79621", lon="-122.4118099", stopId="37.79621", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="5853", title="Pacific Ave & Powell St", lat="37.7964099", lon="-122.41017", stopId="37.7964099", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="3087", title="Broadway & Stockton St", lat="37.79759", lon="-122.4082899", stopId="37.79759", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="3082", title="Broadway & Columbus", lat="37.79783", lon="-122.4063399", stopId="37.79783", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="3084", title="Broadway & Montgomery St", lat="37.79813", lon="-122.4039599", stopId="37.79813", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="7005", title="Broadway & Sansome St", lat="37.7984", lon="-122.4019099", stopId="37.7984", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="3025", title="Battery St & Broadway", lat="37.7983099", lon="-122.4010899", stopId="37.7983099", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="3030", title="Battery St & Jackson St", lat="37.79686", lon="-122.40077", stopId="37.79686", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="6328", title="Sansome St & Clay St", lat="37.79447", lon="-122.40149", stopId="37.79447", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="6327", title="Sansome St & California St", lat="37.7931799", lon="-122.40122", stopId="37.7931799", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="6334", title="Sansome St & Sutter St", lat="37.7903399", lon="-122.4006099", stopId="37.7903399", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="3013", title="2nd St & Stevenson St", lat="37.7886199", lon="-122.4006499", stopId="37.7886199", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="3011", title="2nd St & Howard St", lat="37.78656", lon="-122.39811", stopId="37.78656", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="3008", title="2nd St & Folsom St", lat="37.7853199", lon="-122.39656", stopId="37.7853199", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="4966", title="Harrison St & 2nd St", lat="37.78419", lon="-122.3954499", stopId="37.78419", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="4967", title="Harrison St & 3rd St", lat="37.7824399", lon="-122.39768", stopId="37.7824399", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="4968", title="Harrison St & 4th St", lat="37.7806699", lon="-122.39991", stopId="37.7806699", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="4969", title="Harrison St & 5th St", lat="37.7789099", lon="-122.40214", stopId="37.7789099", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="4970", title="Harrison St & 6th St", lat="37.77715", lon="-122.4043599", stopId="37.77715", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="4971", title="Harrison St & 7th St", lat="37.7754999", lon="-122.40644", stopId="37.7754999", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="4972", title="Harrison St & 8th St", lat="37.7738699", lon="-122.40851", stopId="37.7738699", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="4973", title="Harrison St & 9th St", lat="37.7724", lon="-122.4103699", stopId="37.7724", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="3238", title="11th St & Harrison St", lat="37.7708499", lon="-122.4126299", stopId="37.7708499", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="4665", title="Folsom St & 11th St", lat="37.7717399", lon="-122.4143", stopId="37.7717399", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="4666", title="Folsom St & 14th St", lat="37.76846", lon="-122.4156699", stopId="37.76846", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="4669", title="Folsom St & 16th St", lat="37.76523", lon="-122.41542", stopId="37.76523", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="4672", title="Folsom St & 18th St", lat="37.7618599", lon="-122.4150899", stopId="37.7618599", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="7732", title="Folsom St & 20st.", lat="37.7587599", lon="-122.4147899", stopId="37.7587599", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="4676", title="Folsom St & 22nd St", lat="37.7554599", lon="-122.4144799", stopId="37.7554599", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="7312", title="Folsom St & 24th St", lat="37.7524399", lon="-122.41413", stopId="37.7524399", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="4680", title="Folsom St & 25th St", lat="37.751", lon="-122.41405", stopId="37.751", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="3931", title="C. Chavez St & Folsom St", lat="37.7483399", lon="-122.4139799", stopId="37.7483399", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="3936", title="C. Chavez St & South Van Ness Ave", lat="37.74831", lon="-122.4157599", stopId="37.74831", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="3935", title="Cesar Chavez St & Mission St", lat="37.74823", lon="-122.4183699", stopId="37.74823", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="6881", title="Valencia St & Cesar Chavez St", lat="37.7482199", lon="-122.42021", stopId="37.7482199", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="6878", title="Valencia St & 25th St", lat="37.7507499", lon="-122.4204399", stopId="37.7507499", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="3486", title="24th St & Valencia St", lat="37.75206", lon="-122.42051", stopId="37.75206", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="3477", title="24th St & Mission St", lat="37.75218", lon="-122.4185499", stopId="37.75218", route_tag="12", direction="12_OB1">, #<Muni::Stop tag="33476", title="24th St & Mission St", lat="37.7523199", lon="-122.41833", stopId="37.7523199", route_tag="12", direction="12_OB1">]>]>

# http://webservices.nextbus.com/service/publicXMLFeed?command=predictions&a=<agency_tag>
# ​&r=<route tag>&s=<stop tag>

# sample of prediction for
# Muni::Route.find(12).outbound.stop_at("2nd St & Folsom St").predictions
# [#<Muni::Prediction epochTime="1422343095918", seconds="1823", minutes="30", isDeparture="false", affectedByLayover="true", dirTag="12_OB1", vehicle="8230", block="1201", tripTag="6521556">, #<Muni::Prediction epochTime="1422344895918", seconds="3623", minutes="60", isDeparture="false", affectedByLayover="true", dirTag="12_OB1", vehicle="8302", block="1203", tripTag="6521557">]

# Prediction methods
# --------------------------------------------------------


# [:epochTime,
#  :epochTime=,
#  :seconds,
#  :seconds=,
#  :minutes,
#  :minutes=,
#  :isDeparture,
#  :isDeparture=,
#  :affectedByLayover,
#  :affectedByLayover=,
#  :dirTag,
#  :dirTag=,
#  :vehicle,
#  :vehicle=,
#  :block,
#  :block=,
#  :tripTag,
#  :tripTag=,
#  :time,
#  :pretty_time,
#  :distance_of_time_in_words,
#  :time_ago_in_words,
#  :distance_of_time_in_words_to_now,
#  :date_select,
#  :time_select,
#  :datetime_select,
#  :select_datetime,
#  :select_date,
#  :select_time,
#  :select_second,
#  :select_minute,
#  :select_hour,
#  :select_day,
#  :select_month,
#  :select_year,
#  :time_tag,
#  :to_h,
#  :each_pair,
#  :marshal_dump,
#  :marshal_load,
#  :modifiable,
#  :new_ostruct_member,
#  :method_missing,
#  :[],
#  :[]=,
#  :delete_field,
#  :table]
# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
# [Muni::Prediction,
#  ActionView::Helpers::DateHelper,
#  Muni::Base,
#  OpenStruct,
#  Object,
#  JSON::Ext::Generator::GeneratorMethods::Object,
#  ActiveSupport::Dependencies::Loadable,
#  PP::ObjectMixin,
#  Kernel,
#  BasicObject]


#methods for Route object
# []
# []=
# delete_field
# direction_at
# directions
# directions=
# each_pair
# inbound
# marshal_dump
# marshal_load
# method_missing
# modifiable
# new_ostruct_member
# outbound
# table
# tag
# tag=
# title
# title=
# to_h
