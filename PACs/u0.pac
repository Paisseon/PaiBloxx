// PaiBloxx u0 Test

function FindProxyForURL(url, host) {
    const u = url.toLowerCase();
    const h = host.toLowerCase();

    if (dnsDomainIs(h, "unc0ver.dev")) {
        return "PROXY lilliana.rf.gd";
    } else {
        return "DIRECT";
    }
}