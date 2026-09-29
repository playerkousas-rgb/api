#!/usr/bin/env python3
"""香港免費 API Python 例子 — 每朝出門簡報
用晒天文台 + 醫管局 + 九巴 API，全部唔使 key。
只用 standard library，python3 直接行。
"""
import json
import urllib.request


def get_json(url: str):
    req = urllib.request.Request(url, headers={"User-Agent": "hk-free-apis-demo"})
    with urllib.request.urlopen(req, timeout=15) as r:
        return json.loads(r.read().decode("utf-8-sig"))


def weather_now():
    """而家天氣（尖沙咀氣溫 + 警告）"""
    d = get_json("https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=rhrread&lang=tc")
    for t in d["temperature"]["data"]:
        if t["place"] == "尖沙咀":
            print(f"🌡️ 尖沙咀 {t['value']}°C")
    warn = get_json("https://data.weather.gov.hk/weatherAPI/opendata/weather.php?dataType=warnsum&lang=tc")
    if warn:
        for w in warn.values():
            print(f"⚠️ {w.get('name', '')} 生效中")
    else:
        print("✅ 冇天氣警告")


def ae_wait_times(top: int = 5):
    """急症室輪候（顯示頭 5 間）"""
    d = get_json("https://www.ha.org.hk/opendata/aed/aedwtdata2-tc.json")
    print("\n🏥 急症室（第三類緊急 等候中位數）:")
    for h in d["waitTime"][:top]:
        print(f"  {h['hospName']}: {h.get('t3p50', 'N/A')}")


def kmb_eta(stop_id: str, route: str, service_type: str = "1"):
    """九巴 ETA"""
    d = get_json(f"https://data.etabus.gov.hk/v1/transport/kmb/eta/{stop_id}/{route}/{service_type}")
    print(f"\n🚌 九巴 {route} 號:")
    for eta in d["data"][:3]:
        print(f"  {eta.get('eta') or '未有班次'} → {eta.get('dest_tc')}")


if __name__ == "__main__":
    weather_now()
    ae_wait_times()
    # 例子站：尖沙咀碼頭 (可用 /v1/transport/kmb/stop 搵你嘅站 ID)
    # kmb_eta("A3ADFCDF8487ADB9", "1A")
