$swidth=10
$sheight=10

$a=[]
def init_array()
  for y in 0..$sheight-1 do
    col=[]
    for x in 0..$swidth-1 do
      col.push(0)
    end
    print (p col.map {|x| x==1 ? '@' : ' '}).join(' ')
    puts ""
    $a.push(col)
  end
end

def draw()
  for y in 0..$sheight-1 do
    s=$a[y].join(" ")
    if s.include? "1"
      s=s.gsub!('1','@')
    end
    if s.include? "0"
      s=s.gsub!('0',' ')
    end
    print s
    puts ""
    for x in 0..$swidth-1 do
      $a[y][x]=0;
    end
  end
end

def line(x1,y1,h)
  for y in [y1-h/2,0].max().to_i()..[y1+h/2,$sheight-1].min().to_i() do
    $a[y][x1]=1
  end
end

init_array()

$bx=($swidth/2).to_i()
$by=($sheight/2).to_i()
$dx=1
$dy=1
$py=($sheight/2).to_i()
$ey=($sheight/2).to_i()
$a[1][2]=1
while true do
  button=""
  system("stty raw -echo")
  button=STDIN.read_nonblock(1) rescue nil
  system("stty -raw echo")
  break if /q/i =~ button
  puts button
  if button=="w" then
    $py=$py-1
  end
  if button=="s" then
    $py=$py+1
  end
  $py=[[$py,$sheight-1-1].min(),1].max()
  $ey=[[$by,$sheight-1-1].min(),1].max()
  $a[$by][$bx]=1
  line(1,$py,3)
  line($swidth-2,$ey,3)
  draw()
  $bx=$bx+$dx
  $by=$by+$dy
  $bx=[[$bx,$swidth-1-1].min(),0].max()
  $by=[[$by,$sheight-1].min(),0].max()
  if $bx==$swidth-1-1 then
    $dx=-1
  end
  if $bx==0 then
    $dx=1
  end
  if $by==$sheight-1 then
    $dy=-1
  end
  if $by==0 then
    $dy=1
  end
  if $bx==1 and $by<=$py+1 and $by>=$py-1 then
    $dx=1
  end
  if $bx==0 then
    $bx=($swidth/2).to_i()
    $by=($sheight/2).to_i()
    $dx=1
    $dy=1
  end
  sleep(0.5)
  system "clear" || "cls"
end