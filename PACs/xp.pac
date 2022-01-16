function FindProxyForURL(url, host) {
	const ALLOW = "DIRECT";
	const DENY = "PROXY 0.0.0.0:53";
	const u = url.toLowerCase();
	const h = host.toLowerCase();

	if (dnsDomainIs(h, "discord.com") || dnsDomainIs(h, "cypwn.xyz") || dnsDomainIs(h, ".local")) {
		return ALLOW;
	}

	if (dnsDomainIs(h, "2o7.net") || shExpMatch(u, "3*[0-9].space") || shExpMatch(u, "admob") || dnsDomainIs(h, ".adjust.io") || dnsDomainIs(h, "ads.google.com") || dnsDomainIs(h, "adservice.google.com") || shExpMatch(u, "ads") || shExpMatch(u, "advertising") || dnsDomainIs(h, "adtago.s3.amazonaws.com") || dnsDomainIs(h, "affiliationjs.s3.amazonaws.com") || dnsDomainIs(h, "amazonaax.com") || dnsDomainIs(h, "amazonclix.com") || shExpMatch(u, "analytics") || dnsDomainIs(h, "assoc-amazon.com") || dnsDomainIs(h, "authedmine.com") || shExpMatch(u, "/banner") || dnsDomainIs(h, ".bid") || dnsDomainIs(u, "bigdata.ssp.samsung.com") || shExpMatch(u, "bugsnag") || dnsDomainIs(h, "business.samsungusa.com") || shExpMatch(u, "coin(-|)hive") || dnsDomainIs(h, "crypto-loot.com") || dnsDomainIs(h, "d.reddit.com") || dnsDomainIs(h, "fbcdn.net") || dnsDomainIs(h, "fbsbx.com") || dnsDomainIs(h, "doubleclick.net") || dnsDomainIs(h, "events.redditmedia.com") || dnsDomainIs(h, "facebook.com") || dnsDomainIs(h, "fastclick.com") || dnsDomainIs(h, "fastclick.net") || shExpMatch(u, "firebaselogging*googleapis.com") || dnsDomainIs(h, "flurry.com") || dnsDomainIs(h, "freshmarketer.com") || dnsDomainIs(h, "fundingchoicesmessages.google.com") || dnsDomainIs(h, "googleadservices.com") || dnsDomainIs(h, "google-analytics.com") || dnsDomainIs(h, "googlecode.com") || dnsDomainIs(h, "googlesyndication.com") || dnsDomainIs(h, "hicloud.com") || shExpMatch(u, "hotjar") || dnsDomainIs(h, "imasdk.googleapis.com") || shExpMatch(u, "luckyorange") || dnsDomainIs(h, "media.net") || shExpMatch(u, "medialytics") || shExpMatch(u, "metrics") || dnsDomainIs(h, "miui.com") || dnsDomainIs(h, "mouseflow.com") || shExpMatch(u, "noopener") || shExpMatch(u, "oneplus") || shExpMatch(u, "pagead") || dnsDomainIs(h, ".pinterest.com") || shExpMatch(u, "popunder") || shExpMatch(u, "redirect") || dnsDomainIs(h, "rereddit.com") || dnsDomainIs(h, "rocks.io") || dnsDomainIs(h, "samsungadhub.com") || shExpMatch(u, "sentry") || dnsDomainIs(h, "stats.wp.com") || dnsDomainIs(h, "suprnova.cc") || dnsDomainIs(h, "tfbnw.net") || shExpMatch(u, "tracking") || dnsDomainIs(h, "xiomi.com") || dnsDomainIs(h, "xiaomi.net") || shExpMatch(u, "yandex")) {
		return DENY;
	}

	return ALLOW;
}