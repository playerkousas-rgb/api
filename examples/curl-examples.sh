#!/usr/bin/env bash
# 香港免費 API — curl 速查（全部唔使 key）
# 用法：bash curl-examples.sh <編號>，或者直接 copy 入 terminal

set -e

case "${1:-help}" in
  1) # 現時天氣
    curl -s "https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=rhrread&lang=tc" ;;
  2) # 九天預報
    curl -s "https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=fnd&lang=tc" ;;
  3) # 天氣警告（打風/黑雨）
    curl -s "https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=warnsum&lang=tc" ;;
  4) # 九巴全部路線
    curl -s "https://data.etabus.gov.hk/v1/transport/kmb/route/" ;;
  5) # 港鐵下一班車（將軍澳線調景嶺）
    curl -s "https://rt.data.gov.hk/v1/transport/mtr/getSchedule.php?line=TKL&sta=TIK" ;;
  6) # 城巴路線
    curl -s "https://rt.data.gov.hk/v2/transport/citybus/route/ctb" ;;
  7) # 急症室輪候時間
    curl -s "https://www.ha.org.hk/opendata/aed/aedwtdata2-tc.json" ;;
  8) # 停車場空位
    curl -s "https://api.data.gov.hk/v1/carpark-info-vacancy?data=vacancy&lang=zh_TW" ;;
  9) # 公眾假期
    curl -s "https://www.1823.gov.hk/common/ical/tc.json" ;;
  10) # 機場航班（今日抵港）
    curl -s "https://www.hongkongairport.com/flightinfo-rest/rest/flights/past?date=$(date +%Y-%m-%d)&lang=zh_HK&cargo=false&arrival=true" ;;
  11) # 地址查詢 ALS
    curl -s -H "Accept: application/json" "https://www.als.gov.hk/lookup?q=旺角彌敦道546號&n=3" ;;
  12) # AQHI 空氣質素
    curl -s "https://www.aqhi.gov.hk/epd/ddata/html/out/24aqhi_Eng.xml" ;;
  13) # 地震速報
    curl -s "https://data.weather.gov.hk/weatherAPI/opendata/earthquake.php?dataType=qem&lang=tc" ;;
  14) # 各區人口密度（統計處 表110-02001）
    curl -s "https://www.censtatd.gov.hk/api/get.php?id=110-02001&lang=tc&full_series=1" ;;
  15) # 消費物價指數 CPI（統計處 表510-60001）
    curl -s "https://www.censtatd.gov.hk/api/get.php?id=510-60001&lang=tc&full_series=1" ;;
  16) # 失業率／勞動人口（統計處 表210-06101）
    curl -s "https://www.censtatd.gov.hk/api/get.php?id=210-06101&lang=tc&full_series=1" ;;
  17) # 外幣兌換率（統計處 表340-46001）
    curl -s "https://www.censtatd.gov.hk/api/get.php?id=340-46001&lang=tc&full_series=1" ;;
  18) # 統計處全部 592 個數據集清單（CKAN）
    curl -s "https://data.gov.hk/tc-data/api/3/action/package_search?q=organization:hk-censtatd&rows=1000&fl=name,title" ;;
  *)
    echo "用法: bash curl-examples.sh <1-18>"
    echo " 1=現時天氣 2=九天預報 3=天氣警告 4=九巴路線 5=港鐵班次"
    echo " 6=城巴路線 7=急症室 8=泊車 9=假期 10=航班 11=地址 12=AQHI 13=地震"
    echo " 14=人口密度 15=CPI 16=失業率 17=匯率 18=統計處數據集清單" ;;
esac
