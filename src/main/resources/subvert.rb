def timeinsecs(time)
  a = time.split(':').map(&:to_i).map(&:to_f)
  a[0]=a[0] * 60 * 60
  a[1]=a[1] * 60
  a[2]=a[2]
  a[3]=a[3] / 100
  sum = a.reduce(:+)
  return sum
end

def splittime(time)
  ss, dd = time.divmod(1)
  mm, ss = time.divmod(60)
  hh, mm = mm.divmod(60)
  string = "%02d:%02d:%06.3f" % [hh, mm, ss]
  string.gsub!(".",",")
  return string
end

offset = timeinsecs($offset)
timeins = splittime(timeinsecs($TimeIn) - offset)
timeouts = splittime(timeinsecs($TimeOut) - offset)
output = ""
output << $counter.to_s + "\n"
output << timeins
output << " --> "
output << timeouts
output << "\n"
output << $Text
output << "\n\n"

return output