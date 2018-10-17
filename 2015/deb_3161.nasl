# OpenVAS Vulnerability Test
# $Id: deb_3161.nasl 9355 2018-04-06 07:16:07Z cfischer $
# Auto-generated from advisory DSA 3161-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#


if(description)
{
    script_oid("1.3.6.1.4.1.25623.1.0.703161");
    script_version("$Revision: 9355 $");
    script_cve_id("CVE-2015-0245");
    script_name("Debian Security Advisory DSA 3161-1 (dbus - security update)");
    script_tag(name: "last_modification", value: "$Date: 2018-04-06 09:16:07 +0200 (Fri, 06 Apr 2018) $");
    script_tag(name: "creation_date", value: "2015-02-11 00:00:00 +0100 (Wed, 11 Feb 2015)");
    script_tag(name:"cvss_base", value:"1.9");
    script_tag(name:"cvss_base_vector", value:"AV:L/AC:M/Au:N/C:N/I:N/A:P");
    script_tag(name: "solution_type", value: "VendorFix");

    script_xref(name: "URL", value: "http://www.debian.org/security/2015/dsa-3161.html");


    script_category(ACT_GATHER_INFO);

    script_copyright("Copyright (c) 2015 Greenbone Networks GmbH http://greenbone.net");
    script_family("Debian Local Security Checks");
    script_dependencies("gather-package-list.nasl");
    script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
    script_tag(name: "affected",  value: "dbus on Debian Linux");
    script_tag(name: "insight",   value: "D-Bus is a message bus, used for
sending messages between applications. Conceptually, it fits somewhere in
between raw sockets and CORBA in terms of complexity.");
    script_tag(name: "solution",  value: "For the stable distribution (wheezy),
this problem has been fixed in version 1.6.8-1+deb7u6.

For the unstable distribution (sid), this problem has been fixed in
version 1.8.16-1.

We recommend that you upgrade your dbus packages.");
    script_tag(name: "summary",   value: "Simon McVittie discovered a local
denial of service flaw in dbus, an asynchronous inter-process communication
system. On systems with systemd-style service activation, dbus-daemon does not
prevent forged ActivationFailure messages from non-root processes. A malicious
local user could use this flaw to trick dbus-daemon into thinking that systemd
failed to activate a system service, resulting in an error reply back to
the requester.");
    script_tag(name: "vuldetect", value: "This check tests the installed software
version using the apt package manager.");
    script_tag(name:"qod_type", value:"package");
    exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"dbus", ver:"1.6.8-1+deb7u6", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dbus-1-dbg", ver:"1.6.8-1+deb7u6", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dbus-1-doc", ver:"1.6.8-1+deb7u6", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"dbus-x11", ver:"1.6.8-1+deb7u6", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libdbus-1-3", ver:"1.6.8-1+deb7u6", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"libdbus-1-dev", ver:"1.6.8-1+deb7u6", rls_regex:"DEB7.[0-9]")) != NULL) {
    report += res;
}

if (report != "") {
    security_message(data:report);
} else if (__pkg_match) {
    exit(99); # Not vulnerable.
}
