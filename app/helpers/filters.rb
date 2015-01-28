helpers do
  # def filter_stop_results(config)

  # end

  # takes a config hash and a MuniAccessor::Struct object
  def filter_inbound_or_outbound(config, localroute)
    results = []
    results << { inbound: localroute.list_inbound_stops } unless config[:inbound].nil?
    results << { outbound: localroute.list_outbound_stops } unless config[:outbound].nil?
    results
  end

  def find_stop_by_tag(tag, localroute)
    result = localroute[0]["table"]["directions"][0]["table"]["stops"].select do |table|
      table["table"]["tag"] == tag.to_s
    end
    result.first
  end
end
