// PaiBloxx Experimental

const ALLOW = "DIRECT"
const DENY = "PROXY 0.0.0.0:53"

function FindProxyForURL(url, host) {
	const u = url.toLowerCase()
	const h = host.toLowerCase()
	
	if (dnsDomainIs(h, "discord.com") || dnsDomainIs(h, "github.io")) {
		return ALLOW
	}
	
	if (shExpMatch(u, "*admob*") || dnsDomainIs(h, ".adjust.io") || dnsDomainIs(h, "ads.google.com") || dnsDomainIs(h, "adservice.google.com") || shExpMatch(u, "*ads*") || shExpMatch(u, "*advertising*") || dnsDomainIs(h, "adtago.s3.amazonaws.com") || dnsDomainIs(h, "affiliationjs.s3.amazon.com") || dnsDomainIs(h, "amazonaax.com") || dnsDomainIs(h, "amazonclix.com") || shExpMatch(u, "*analytics*") || dnsDomainIs(h, "assoc-amazon.com") || dnsDomainIs(h, "bugsnag.com") || dnsDomainIs(h, "d.reddit.com") || dnsDomainIs(h, "doubleclick.net") || dnsDomainIs(h, "events.redditmedia.com") || dnsDomainIs(h, "facebook.com") || dnsDomainIs(h, "fastclick.com") || dnsDomainIs(h, "fastclick.net") || dnsDomainIs(h, "firebaselogging.googleapis.com") || dnsDomainIs(h, "flurry.com") || dnsDomainIs(h, "freshmarketer.com") || dnsDomainIs(h, "fundingchoicesmessages.google.com") || dnsDomainIs(h, "googleadservices.com") || dnsDomainIs(h, "google-analytics.com") || dnsDomainIs(h, "googlecode.com") || dnsDomainIs(h, "googlesyndication.com") || dnsDomainIs(h, "hicloud.com") || shExpMatch(u, "*hotjar*") || dnsDomainIs(h, "imasdk.googleapis.com") || shExpMatch(u, "*luckyorange*") || dnsDomainIs(h, "media.net") || shExpMatch(u, "*medialytics*") || shExpMatch(u, "*metrics*") || dnsDomainIs(h, "miui.com") || dnsDomainIs(h, "mouseflow.com") || shExpMatch(u, "*noopener*") || shExpMatch(u, "*oneplus*") || shExpMatch(u, "*pagead*") || dnsDomainIs(h, ".pinterest.com") || shExpMatch(u, "*popunder*") || shExpMatch(u, "*redirect*") || dnsDomainIs(h, "rereddit.com") || shExpMatch(u, "*samsung*") || shExpMatch(u, "*sentry*") || dnsDomainIs(h, "stats.wp.com") || dnsDomainIs(h, "xiomi.com") || dnsDomainIs(h, "xiomi.net") || shExpMatch(u, "*yandex*")) {
		return DENY
	}
	
	return ALLOW
}