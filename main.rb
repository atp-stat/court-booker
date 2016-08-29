require 'selenium-webdriver'
require './config.rb'
driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://yoyaku.sports.metro.tokyo.jp/user/view/user/homeIndex.html"
driver.find_elements(:id, 'goBtn')[1].click
form_userid = driver.find_element(:id, 'userid')
form_userid.clear
form_userid.send_keys(@userid)
form_passwd = driver.find_element(:id, 'passwd')
form_passwd.clear
form_passwd.send_keys(@passwd)
sleep 3

driver.find_element(:id, 'login').click
driver.find_element(:id, 'purposeSearch').click
if @rsrv_month == 'this_month'
elsif @rsrv_month == 'next_month'
  driver.find_element(:xpath, '//*[@id="calendar"]/table[1]/tbody/tr/td/div/a').click
else
  p "rsrv_month error. Please put 'this_month' or 'next_month' in '@rsrv_month'"
  driver.quit
  exit
end
calender_days = driver.find_elements(:class, 'calclick')
calender_days.each_with_index do |day,n|
  calender_days[n] = day.text
end
rsrv_day = calender_days.index(@rsrv_day)
driver.find_elements(:class, 'calclick')[rsrv_day].click
sleep 1
driver.find_element(:name, 'layoutChildBody:childForm:purposeSearchItems:0:selectItemsItems:0:selectItems:2:checked').click
driver.find_element(:name, 'layoutChildBody:childForm:purposeSearchItems:0:selectItemsItems:0:selectItems:3:checked').click
driver.find_element(:id, 'srchBtn').click

pages = driver.find_elements(:id, 'pageDisp')
pages.each_with_index do |page,n|
  pages[n] = page.text
end
case @rsrv_court_name[0]
when "日比谷公園"
  driver.find_element(:id, 'goNextPager').click
  driver.find_element(:id, 'goPrevPager').click
when "芝公園"
  driver.find_element(:id, 'goNextPager').click
  driver.find_element(:id, 'goPrevPager').click
when "猿江恩賜公園"
  driver.find_element(:id, 'goNextPager').click
  driver.find_element(:id, 'goPrevPager').click
when "亀戸中央公園"
  driver.find_element(:id, 'goNextPager').click
  driver.find_element(:id, 'goPrevPager').click
when "木場公園"
  driver.find_element(:id, 'goNextPager').click
  driver.find_element(:id, 'goPrevPager').click
when "祖師谷公園"
  page_number = pages.index('2')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "東白鬚公園"
  page_number = pages.index('2')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "浮間公園"
  page_number = pages.index('2')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "城北中央公園Ａ"
  page_number = pages.index('2')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "城北中央公園Ｂ"
  page_number = pages.index('2')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "赤塚公園"
  page_number = pages.index('3')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "東綾瀬公園"
  page_number = pages.index('3')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "舎人公園"
  page_number = pages.index('3')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "篠崎公園Ａ"
  page_number = pages.index('3')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "大島小松川公園Ａ"
  page_number = pages.index('3')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "汐入公園"
  page_number = pages.index('4')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "善福寺川緑地"
  page_number = pages.index('4')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "光が丘公園"
  page_number = pages.index('4')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "石神井公園Ｂ"
  page_number = pages.index('4')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "井の頭恩賜公園"
  page_number = pages.index('4')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "武蔵野中央公園"
  page_number = pages.index('5')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "小金井公園"
  page_number = pages.index('5')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "野川公園"
  page_number = pages.index('5')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "府中の森公園"
  page_number = pages.index('5')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "東大和南公園"
  page_number = pages.index('5')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "大井ふ頭海浜公園Ａ（ハード）"
  page_number = pages.index('6')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "大井ふ頭海浜公園Ａ（人工芝）"
  page_number = pages.index('6')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "大井ふ頭海浜公園B（ハード）"
  page_number = pages.index('6')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "有明テニスの森公園Ａ（ハード）"
  page_number = pages.index('6')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "有明テニスの森公園Ｂ（ハード）"
  page_number = pages.index('6')
  driver.find_elements(:id, 'pageDisp')[page_number].click
when "有明テニスの森公園Ｃ／テニス（人工芝）"
  page_number = pages.index('7')
  driver.find_elements(:id, 'pageDisp')[page_number].click
else
end

court_rsrv_flag = 0

while court_rsrv_flag == 0
  prefer_park_names = @rsrv_court_name
  prefer_park_names_count = @rsrv_court_name.length
  prefer_times = @rsrv_time
  prefer_times_count = @rsrv_time.length

  court_tables = driver.find_element(:id, 'isNotEmptyPager').find_elements(:class, 'tablebg2')
  if court_tables.size == 7
    court_tables.shift
    court_tables.pop
  end

  park_names = driver.find_elements(:id, 'bnamem')
  park_names.each_with_index do |park_name,n|
    park_names[n] = park_name.text
  end

  prefer_park_names_count.times{|n|
    court_index_number = park_names.index(prefer_park_names[n])
    prefer_times_count.times{|t|
      times = court_tables[court_index_number].find_elements(:id, 'tzoneStimeLabel')
      times.each_with_index do |time,n|
        times[n] = time.text
      end
      time_index_number = times.index(prefer_times[t])
      court_tables[court_index_number].find_elements(:id, 'isNotEmp')[time_index_number].click
      if court_tables[court_index_number].find_elements(:id, 'isNotEmp')[time_index_number].find_element(:id, 'sel').attribute('value') == 1.to_s
        court_rsrv_flag = 1
        p "[success!!] Reserved the tennis court -> #{prefer_park_names[n]},#{prefer_times[t]}"
        @prefer_park_name = prefer_park_names[n]
        @prefer_time = prefer_times[t]
        break
      else
        p "[false...] Full of reservation the tennis court -> #{prefer_park_names[n]},#{prefer_times[t]}"
      end
    }
    if court_rsrv_flag == 1
      break
    end
  }
  if court_rsrv_flag == 1
    break
  else
    driver.navigate.refresh
  end
end

driver.find_element(:id, 'doReserve').click
driver.find_element(:id, 'apply').click
reserve_number = driver.find_element(:class, 'm-35').text
p "[Success!!] Reserved the tennis court -> #{@rsrv_day}日#{@prefer_time}, #{@prefer_park_name}"
p "Reseved number :#{reserve_number}"
sleep 2

driver.quit
