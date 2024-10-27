import 'package:fiber/config/constant.dart';
import 'package:fiber/main.dart';
import 'dart:io';

class SassEndpoint {
  Future<String?> getEndpoint() async {
    // prefs.clear();
    var gov = prefs.getInt("gov");
    print(gov);
    if (gov == null) {
      return "http://185.16.25.249:2220";
    }

    if (gov == 1) {
      return "http://185.16.25.254";
    } else {
      return "http://185.16.25.249:2220"; // http://94.176.40.66
    }
  }


  static Future<String> getLocalIpAddress() async {
    final interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4, includeLinkLocal: true);

    try {
      // Try VPN connection first
      NetworkInterface vpnInterface =
          interfaces.firstWhere((element) => element.name == "tun0");
      return vpnInterface.addresses.first.address;
    } on StateError {
      // Try wlan connection next
      try {
        NetworkInterface interface =
            interfaces.firstWhere((element) => element.name == "wlan0");
        return interface.addresses.first.address;
      } catch (ex) {
        // Try any other connection next
        try {
          NetworkInterface interface = interfaces.firstWhere((element) =>
              !(element.name == "tun0" || element.name == "wlan0"));
          return interface.addresses.first.address;
        } catch (ex) {
          return "";
        }
      }
    }
  }

  String determineEndpoint(String ip) {
    final ipRanges = {
      "Kut": {
        "P1": "10.150.0.0/16",
        "P2": "10.151.0.0/16",
        "P3": "10.152.0.0/16",
        "EXP": "10.153.0.0/16",
        "endpoint": "http://185.16.25.254"
      },
      "Basra": {
        "P1": "10.160.0.0/16",
        "P2": "10.161.0.0/16",
        "P3": "10.162.0.0/16",
        "EXP": "10.163.0.0/16",
        "endpoint": "http://94.176.40.66"
      }
    };

    final ipParts = ip.split('.').map(int.parse).toList();

    List<int> cidrToMask(String cidr) {
      final parts = cidr.split('/');
      final prefixLength = int.parse(parts[1]);
      final mask = List.filled(4, 0);
      for (int i = 0; i < 4; i++) {
        if (prefixLength >= (i + 1) * 8) {
          mask[i] = 255;
        } else if (prefixLength > i * 8) {
          mask[i] = (256 - (1 << (8 - (prefixLength - i * 8))));
        }
      }
      return mask;
    }

    bool isInSubnet(List<int> ip, String subnet) {
      final parts = subnet.split('/');
      final subnetIp = parts[0].split('.').map(int.parse).toList();
      final mask = cidrToMask(subnet);
      for (int i = 0; i < 4; i++) {
        if ((ip[i] & mask[i]) != (subnetIp[i] & mask[i])) {
          return false;
        }
      }
      return true;
    }

    for (final location in ipRanges.keys) {
      final details = ipRanges[location]!;
      for (final range in details.keys) {
        if (range != "endpoint" && isInSubnet(ipParts, details[range]!)) {
          print(details);
          return details["endpoint"]!;
        }
      }
    }

    return "http://185.16.25.249:2220";
  }
}
