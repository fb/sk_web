ppdf.centered_header="Hauptflugbuch #{Rails.configuration.location}"
render :partial=>'partials/date_range', :locals=>{:ppdf=>ppdf, :date_range=>@date_range}

render :partial=>'partials/flight_count', :locals=>{:ppdf=>ppdf, :num_flights=>@flights.size}
ppdf.paragraph
ppdf.render_table @table unless @flights.empty?

