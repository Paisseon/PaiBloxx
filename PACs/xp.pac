// PaiBloxx Experimental

function FindProxyForURL(url, host) {
	const u = url.toLowerCase()
	const h = host.toLowerCase()
	
	if (shExpMatch(u, "*000webhost*") || dnsDomainIs(h, "cypwn.xyz") || dnsDomainIs(h, "discord.com") || dnsDomainIs(h, "github.io")) {
		return "DIRECT"
	}
	
	if (shExpMatch(u, "*admob*") || dnsDomainIs(h, ".adjust.io") || dnsDomainIs(h, "ads.google.com") || dnsDomainIs(h, "adservice.google.com") || shExpMatch(u, "*ads*") || shExpMatch(u, "*advertising*") || dnsDomainIs(h, "adtago.s3.amazonaws.com") || dnsDomainIs(h, "affiiliationjs.s3.amazon.com") || dnsDomainIs(h, "amazonaax.com") || dnsDomainIs(h, "amazonclix.com") || shExpMatch(u, "*analytics*") || dnsDomainIs(h, "app-measurement.com") || dnsDomainIs(h, "assoc-amazon.com") || dnsDomainIs(h, "bolt-gcdn.sc-cdn.net") || dnsDomainIs(h, "bugsnag.com") || dnsDomainIs(h, "data.ea.com") || dnsDomainIs(h, "doubleclick.net") || dnsDomainIs(h, "events.redditmedia.com") || dnsDomainIs(h, "facebook.com") || dnsDomainIs(h, "fastclick.com") || dnsDomainIs(h, "fastclick.net") || dnsDomainIs(h, "flurry.com") || dnsDomainIs(h, "freshmarketer.com") || dnsDomainIs(h, "fundingchoicesmessages.google.com") || dnsDomainIs(h, "gcp.api.snapchat.com") || dnsDomainIs(h, "googleadservices.com") || dnsDomainIs(h, "google-analytics.com") || dnsDomainIs(h, "googlecode.com") || dnsDomainIs(h, "googlesyndication.com") || dnsDomainIs(h, "gtq6.sct.sc-prod.net") || dnsDomainIs(h, "hicloud.com") || shExpMatch(u, "*hotjar*") || dnsDomainIs(h, "imasdk.googleapis.com") || shExpMatch(u, "*logging*") || shExpMatch(u, "*luckyorange*") || dnsDomainIs(h, "media.net") || shExpMatch(u, "*medialytics*") || shExpMatch(u, "*metrics*") || dnsDomainIs(h, "miui.com") || dnsDomainIs(h, "mouseflow.com") || shExpMatch(u, "*noopener*") || shExpMatch(u, "*oneplus*") || shExpMatch(u, "*pagead*") || dnsDomainIs(h, ".pinterest.com") || shExpMatch(u, "*popunder*") || shExpMatch(u, "*redirect*") || dnsDomainIs(h, "rereddit.com") || shExpMatch(u, "*samsung*") || dnsDomainIs(h, "snapads.com") || dnsDomainIs(h, "snapchat-proxy.appspot.com") || shExpMatch(u, "*sentry*") || dnsDomainIs(h, "stats.wp.com") || shExpMatch(u, "*telemetry*") || dnsDomainIs(h, "us-east1-aws.api.snapchat.com") || dnsDomainIs(h, "xiomi.com") || dnsDomainIs(h, "xiomi.net") || shExpMatch(u, "*yandex*")) {
		return "PROXY 0.0.0.0:53"
	}
	
	return "DIRECT"
}