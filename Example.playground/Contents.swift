import UIKit

var greeting = "Hello, playground"



let data = """
{
2"identity": "jarlynpolanco@gmail.com",
3"code": "uber",
4"cookies": [
5{
6"name": "jwt-session",
7"value": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpYXQiOjE2NjExNzcyNzcsImRhdGEiOnsidGVuYW5jeSI6InViZXIvcHJvZHVjdGlvbiJ9LCJleHAiOjE2NjEyNjM2Nzd9.Pw3uZuNBejVtkhbW1W2PLXbhy6NW3BkeBVgSdCd8XLo"
8},
9{
10"name": "mp_adec770be288b16d9008c964acfba5c2_mixpanel",
11"value": "%7B%22distinct_id%22%3A%20%22a4de90b0-8fa7-4690-ae4f-bcd66e0a5fc9%22%2C%22%24device_id%22%3A%20%22182a1f0001b503-04e1f7ba716e3-1b525635-1fa400-182a1f0001c116c%22%2C%22%24initial_referrer%22%3A%20%22https%3A%2F%2Fdrivers.uber.com%2Fp3%2Fpayments%2Fperformance-hub%22%2C%22%24initial_referring_domain%22%3A%20%22drivers.uber.com%22%2C%22%24user_id%22%3A%20%22a4de90b0-8fa7-4690-ae4f-bcd66e0a5fc9%22%7D"
12},
13{
14"name": "_gcl_au",
15"value": "1.1.1262372456.1660574161"
16},
17{
18"name": "utag_main",
19"value": "v_id:0182a1eed702005198c46959cee805075001b06d00bd0$_sn:2$_ss:0$_st:1660832030029$segment:b$optimizely_segment:b$ses_id:1660830224242%3Bexp-session$_pn:1%3Bexp-session"
20},
21{
22"name": "_ga",
23"value": "GA1.1.1307844420.1660574162"
24},
25{
26"name": "_ga_XTGQLY6KPT",
27"value": "GS1.1.1660830225.2.0.1660830230.0.0.0"
28},
29{
30"name": "sid",
31"value": "QA.CAESEIbssgc4KEALiJK-r44Cmv0Y8M6HmQYiATEqJGE0ZGU5MGIwLThmYTctNDY5MC1hZTRmLWJjZDY2ZTBhNWZjOTJA26-xziUIzFm1xwAyf48DzmaFWtpN7acHf8Z8G7oM3edZZtMGNxDb4uph0aiTED2Saf4Frq0eWlyIDecNeowuajoBMUIIdWJlci5jb20.ixtZ5OyOsNvVGdAQjkHRjaX95bMJhyqYQ8-0GTmOL9A"
32},
33{
34"name": "optimizelyEndUserId",
35"value": "oeu1660574160384r0.7022556031392015"
36},
37{
38"name": "usl_rollout_id",
39"value": "f3fcf25b-4c78-417a-ba67-4e35b006a95f"
40},
41{
42"name": "segmentCookie",
43"value": "b"
44},
45{
46"name": "csid",
47"value": "1.1663166481609.jQZ5LyxFAZBYhEqPaw1WyP6eAFUfFBdU+5Hh8F2N/fc="
48},
49{
50"name": "CONSENTMGR",
51"value": "c1:1%7Cc2:1%7Cc3:1%7Cc4:1%7Cc5:1%7Cc6:1%7Cc7:1%7Cc8:1%7Cc9:1%7Cc10:1%7Cc11:1%7Cc12:1%7Cc13:1%7Cc14:1%7Cc15:1%7Cts:1660574160860%7Cconsent:true"
52},
53{
54"name": "utag_geo_code",
55"value": "US"
56},
57{
58"name": "marketing_vistor_id",
59"value": "70a6d457-577e-4523-af98-96ab404f8bec"
60}
61],
62"data": {},
63"userAgent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/101.0.4951.67 Safari/537.36"
64}
"""

print(data.filter({!$0.isNumber}))


