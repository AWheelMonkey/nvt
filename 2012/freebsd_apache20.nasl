###############################################################################
# OpenVAS Vulnerability Test
# $Id: freebsd_apache20.nasl 11762 2018-10-05 10:54:12Z cfischer $
#
# Auto generated from VID 4b7dbfab-4c6b-11e1-bc16-0023ae8e59f0
#
# Authors:
# Thomas Reinke <reinke@securityspace.com>
#
# Copyright:
# Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com
# Text descriptions are largely excerpted from the referenced
# advisories, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2,
# as published by the Free Software Foundation
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.70737");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_cve_id("CVE-2011-3368", "CVE-2011-3607", "CVE-2011-4317", "CVE-2012-0021", "CVE-2012-0031", "CVE-2012-0053");
  script_version("$Revision: 11762 $");
  script_tag(name:"last_modification", value:"$Date: 2018-10-05 12:54:12 +0200 (Fri, 05 Oct 2018) $");
  script_tag(name:"creation_date", value:"2012-02-12 07:27:19 -0500 (Sun, 12 Feb 2012)");
  script_name("FreeBSD Ports: apache");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2012 E-Soft Inc. http://www.securityspace.com");
  script_family("FreeBSD Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/freebsd", "ssh/login/freebsdrel");

  script_tag(name:"insight", value:"The following package is affected: apache

CVE-2011-3368
The mod_proxy module in the Apache HTTP Server 1.3.x through 1.3.42,
2.0.x through 2.0.64, and 2.2.x through 2.2.21 does not properly
interact with use of (1) RewriteRule and (2) ProxyPassMatch pattern
matches for configuration of a reverse proxy, which allows remote
attackers to send requests to intranet servers via a malformed URI
containing an initial @ (at sign) character.

CVE-2011-3607
Integer overflow in the ap_pregsub function in server/util.c in the
Apache HTTP Server 2.0.x through 2.0.64 and 2.2.x through 2.2.21, when
the mod_setenvif module is enabled, allows local users to gain
privileges via a .htaccess file with a crafted SetEnvIf directive, in
conjunction with a crafted HTTP request header, leading to a
heap-based buffer overflow.

CVE-2011-4317
The mod_proxy module in the Apache HTTP Server 1.3.x through 1.3.42,
2.0.x through 2.0.64, and 2.2.x through 2.2.21, when the Revision
1179239 patch is in place, does not properly interact with use of (1)
RewriteRule and (2) ProxyPassMatch pattern matches for configuration
of a reverse proxy, which allows remote attackers to send requests to
intranet servers via a malformed URI containing an @ (at sign)
character and a : (colon) character in invalid positions.  NOTE: this
vulnerability exists because of an incomplete fix for CVE-2011-3368.

CVE-2012-0021
The log_cookie function in mod_log_config.c in the mod_log_config
module in the Apache HTTP Server 2.2.17 through 2.2.21, when a
threaded MPM is used, does not properly handle a %{}C format string,
which allows remote attackers to cause a denial of service (daemon
crash) via a cookie that lacks both a name and a value.

CVE-2012-0031
scoreboard.c in the Apache HTTP Server 2.2.21 and earlier might allow
local users to cause a denial of service (daemon crash during
shutdown) or possibly have unspecified other impact by modifying a
certain type field within a scoreboard shared memory segment, leading
to an invalid call to the free function.

CVE-2012-0053
protocol.c in the Apache HTTP Server 2.2.x through 2.2.21 does not
properly restrict header information during construction of Bad
Request (aka 400) error documents, which allows remote attackers to
obtain the values of HTTPOnly cookies via vectors involving a (1) long
or (2) malformed header in conjunction with crafted web script.");

  script_tag(name:"solution", value:"Update your system with the appropriate patches or
  software upgrades.");

  script_tag(name:"summary", value:"The remote host is missing an update to the system
  as announced in the referenced advisory.");

  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-bsd.inc");

vuln = FALSE;
txt = "";

bver = portver(pkg:"apache");
if(!isnull(bver) && revcomp(a:bver, b:"2")>0 && revcomp(a:bver, b:"2.2.22")<0) {
  txt += 'Package apache version ' + bver + ' is installed which is known to be vulnerable.\n';
  vuln = TRUE;
}

if(vuln) {
  security_message(data:txt);
} else if (__pkg_match) {
  exit(99);
}