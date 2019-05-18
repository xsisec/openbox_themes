-- lua script for conky weatherbox

require 'cairo'

function conky_pre()

  conky_parse("${execi 1200 ~/conky_weatherbox/bin/conkyWeather GET}")

end

function conky_post()

  if conky_window == nil then return end

  -- draw suntrail only if network is up
  network = tonumber(conky_parse("${if_gw}1${else}0${endif}"))
  if network == 0 then return end

  -- variables for suntrail
  center_x=120
  center_y=117
  radius=50
  cs = cairo_xlib_surface_create(conky_window.display, conky_window.drawable, conky_window.visual, conky_window.width, conky_window.height)
  cr = cairo_create(cs)

  -- parse values
  sunriseHour,sunriseMin = ParseTime(conky_parse("${execi 1200 ~/conky_weatherbox/bin/conkyWeather astronomy_sunrise}"))
  sunsetHour,sunsetMin = ParseTime(conky_parse("${execi 1200 ~/conky_weatherbox/bin/conkyWeather astronomy_sunset}"))
  sunHour,sunMin = ParseTime(conky_parse("${execi 1200 ~/conky_weatherbox/bin/conkyWeather location_time}"))

  -- get total mins
  sunrise   = TotalMin(sunriseHour,sunriseMin)
  sunset    = TotalMin(sunsetHour,sunsetMin)
  sunOffset = TotalMin(sunHour,sunMin)

  -- first update sun time equals 0 -> division by zero
  if sunOffset == 0 then return end

  -- draw suntrail
  cairo_set_source_rgba (cr,1,1,1,1)
  cairo_set_line_width (cr,1)
  cairo_arc (cr,center_x,center_y,radius,-180*(math.pi/180),0*(math.pi/180))
  cairo_stroke (cr)
  cairo_move_to (cr,center_x/2,center_y)
  cairo_rel_line_to (cr,center_x,0)
  cairo_stroke (cr)

  -- show sunrise and sunset
  cairo_select_font_face (cr, "Liberation Sans", CAIRO_FONT_SLANT_NORMAL, CAIRO_FONT_WEIGHT_NORMAL)
  cairo_set_font_size (cr, 10)
  cairo_set_source_rgba (cr,1,1,1,1)
  cairo_move_to (cr,68,center_y+18)
  cairo_show_text (cr,sunriseHour..":"..sunriseMin)
  cairo_move_to (cr,150,center_y+18)
  cairo_show_text (cr,sunsetHour..":"..sunsetMin)
  cairo_stroke (cr)

  -- make sun 6 pixel
  cairo_set_line_width (cr,6)
  cairo_set_line_cap (cr, CAIRO_LINE_CAP_ROUND)

  -- after sunset
  if sunOffset > sunset then
    cairo_set_source_rgba (cr,0.81,0.36,0,1)
    cairo_arc (cr,center_x,center_y,radius,0*(math.pi/180),0*(math.pi/180))
  -- before sunrise
  elseif sunOffset < sunrise then
    cairo_set_source_rgba (cr,0.88,0.48,0.12,1)
    cairo_arc (cr,center_x,center_y,radius,-180*(math.pi/180),-180*(math.pi/180))
  -- draw sun
  else
    sunGradient = (sunOffset - sunrise) / (sunset - sunrise) * 180
    cairo_set_source_rgba (cr,1,1,0,1)
    cairo_arc (cr,center_x,center_y,radius,(sunGradient-180)*(math.pi/180),(sunGradient-180)*(math.pi/180))
  end
  cairo_stroke (cr)

  cairo_destroy(cr)
  cairo_surface_destroy(cs)

end

function ParseTime(time)

  i = string.find(time, ":")
  j = string.find(time, " ")
  if i == nil then return "0", "0" end
  if j == nil then return "0", "0" end
  hour = string.sub(time,1,i-1)
  min  = string.sub(time,i+1,j-1)
  pm   = string.sub(time,j+1,j+1)
  if hour == "12" then hour = "0" end
  if pm == "P" then hour = hour + 12 end
  return hour, min

end

function TotalMin(hour, min)

  return hour * 60 + min

end

-- functions to call diretly from the script

function conky_TemperatureColor()

  temp=tonumber(conky_parse("${execi 1200 ~/conky_weatherbox/bin/conkyWeather condition_temp}"))

  if temp == nil then return "0" end

  unit=conky_parse("${execi 1200 ~/conky_weatherbox/bin/conkyWeather unit_temperature}")

  -- Celsius
  if unit == "C" then
    condtemp = temp
  -- Fahrenheit
  else
    condtemp = (temp - 32) / 1.8
  end

  if     condtemp >= 30 then color = "ff0000"
  elseif condtemp >= 20 then color = "ff8000"
  elseif condtemp >= 10 then color = "ffff00"
  elseif condtemp >=  0 then color = "ffffff"
  else                       color = "0000ff"
  end

  return "${color "..color.."}"..temp.."${color}"

end

function conky_RainBar(forecast)

  rain=tonumber(conky_parse("${execi 1200 ~/conky_weatherbox/bin/conkyWeather forecast"..forecast.."_rain}"))

  if rain == nil then return 0 end

  return rain

end
