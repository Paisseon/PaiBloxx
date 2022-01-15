// PaiBloxx Experimental

let ALLOW = "DIRECT"
let DENY = "PROXY 0.0.0.0:53"

function FindProxyForURL(url, host) {
	let u = url.toLowerCase()
	let h = host.toLowerCase()
	
	if (s(u, "*admob*") || d(h, ".adjust.io") || d(h, "ads.google.com") || d(h, "adservice.google.com") || s(u, "*ads*") || s(u, "*advertising*") || d(h, "adtago.s3.amazonaws.com") || d(h, "affiiliationjs.s3.amazon.com") || d(h, "amazonaax.com") || d(h, "amazonclix.com") || s(u, "*analytics*") || d(h, "assoc-amazon.com") || d(h, "bugsnag.com") || d(h, "d.reddit.com") || d(h, "doubleclick.net") || d(h, "events.redditmedia.com") || d(h, "facebook.com") || d(h, "fastclick.com") || d(h, "fastclick.net") || d(h, "firebaselogging.googleapis.com") || d(h, "flurry.com") || d(h, "freshmarketer.com") || d(h, "fundingchoicesmessages.google.com") || d(h, "googleadservices.com") || d(h, "google-analytics.com") || d(h, "googlecode.com") || d(h, "googlesyndication.com") || d(h, "hicloud.com") || s(u, "*hotjar*") || d(h, "imasdk.googleapis.com") || s(u, "*luckyorange*") || d(h, "media.net") || s(u, "*medialytics*") || s(u, "*metrics*") || d(h, "miui.com") || d(h, "mouseflow.com") || s(u, "*noopener*") || s(u, "*oneplus*") || s(u, "*pagead*") || d(h, ".pinterest.com") || s(u, "*popunder*") || s(u, "*redirect*") || d(h, "rereddit.com") || s(u, "*samsung*") || s(u, "*sentry*") || d(h, "stats.wp.com") || d(h, "xiomi.com") || d(h, "xiomi.net") || s(u, "*yandex*")) {
		return DENY
	}
	
	return ALLOW
}