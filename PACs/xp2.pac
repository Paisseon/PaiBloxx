"use strict";function FindProxyForURL(url,host){const u=url.toLowerCase();return[/[\/\.]\b(ad(vertise?(ing)?(ments?)?)?s?(-api|ervices?)?)\b/,/[\/\.]\bpop-?(over|under)\b/,/[\/\.]\binterstitials?/,/[\/\.]\bp(re|ost)-?roll\b/,/[\/\.]\bsponsors?(hip|ing)?\b/,/[\/\.]\bmarketing\b/,/[\/\.]\bapplo?vi?n\b/,/[\/\.]\bapps?flyer(sdk)?\b/,/[\/\.]\bad(colony|mob)\b/,/[\/\.]\b(adapty|adjust|bra(nch|ze)|bug(ly|snag)|chartboost|data\.ea|doubleclick|fl[uv]rr[yz]|dutils|emb-api|fastclick|freshmarketer|hotjar|in\.appcenter|inmobi|intercom|leanplum|media|mixpanel|mob|mouseflow|newrelic|optimizely|pangle|perimeterx|rayjump|scalemonk|supersonicads|tap(joy|research)|tenjin|tobsnssdk|unityads|urbanairship|vungle|wildlifestudios|yahoo)\b/,/[\/\.]\bamazon(-adsystem|aax|clix)\b/,/[\/\.]\b(a(.*)(s3)?)amazon\b/,/[\/\.]\b(google-?|topaz-)?(api|ana|crash)-?lytics\b/,/[\/\.]\btrack(ers?|ing)?\b/,/[\/\.]\bu?log(s|ging)\b/,/[\/\.]\brfa\.org\b/,/[\/\.]\b(akamaihd|edgekey|facebook|fbcallback|fbcdn|fbsbx|fburl|freebasics|tfbnw)\b/,/[\/\.]\b(gstaticadssl|google-?adservices?|adwords|feedburner|google-?apis|googlesyndication|googletag(manager|services)|mail-ads|metric\.gstatic|urchin)\b/,/[\/\.]\b(get)?sentry(-cdn)?\b/,/[\/\.]\biadsdk|byteoversea\b/].some((r=>r.test(u)))?"PROXY 0.0.0.0":"DIRECT"}