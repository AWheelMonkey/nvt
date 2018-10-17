###############################################################################
# OpenVAS Vulnerability Test
# $Id: deb_4109.nasl 8849 2018-02-16 14:02:28Z asteins $
#
# Auto-generated from advisory DSA 4109-1 using nvtgen 1.0
# Script version: 1.0
#
# Author:
# Greenbone Networks
#
# Copyright:
# Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net
# Text descriptions are largely excerpted from the referenced
# advisory, and are Copyright (c) the respective author(s)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
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
  script_oid("1.3.6.1.4.1.25623.1.0.704109");
  script_version("$Revision: 8849 $");
  script_cve_id("CVE-2017-18076");
  script_name("Debian Security Advisory DSA 4109-1 (ruby-omniauth - security update)");
  script_tag(name:"last_modification", value:"$Date: 2018-02-16 15:02:28 +0100 (Fri, 16 Feb 2018) $");
  script_tag(name:"creation_date", value:"2018-02-09 00:00:00 +0100 (Fri, 09 Feb 2018)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  script_xref(name:"URL", value:"https://www.debian.org/security/2018/dsa-4109.html");

  script_category(ACT_GATHER_INFO);

  script_copyright("Copyright (c) 2018 Greenbone Networks GmbH http://greenbone.net");
  script_family("Debian Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/debian_linux", "ssh/login/packages");
  script_tag(name:"affected", value:"ruby-omniauth on Debian Linux");
  script_tag(name:"insight", value:"OmniAuth is a Ruby library that standardizes multi-provider
authentication for web applications. It was created to be powerful,
flexible, and do as little as possible. Any developer can create
strategies for OmniAuth that can authenticate users via disparate
systems. OmniAuth strategies have been created for everything from
Facebook to LDAP.");
  script_tag(name:"solution", value:"For the oldstable distribution (jessie), this problem has been fixed
in version 1.2.1-1+deb8u1.

For the stable distribution (stretch), this problem has been fixed in
version 1.3.1-1+deb9u1.

We recommend that you upgrade your ruby-omniauth packages.

For the detailed security status of ruby-omniauth please refer to
its security tracker page at:
https://security-tracker.debian.org/tracker/ruby-omniauth");
  script_tag(name:"summary",  value:"Lalith Rallabhandi discovered that OmniAuth, a Ruby library for
implementing multi-provider authentication in web applications,
mishandled and leaked sensitive information. An attacker with access to
the callback environment, such as in the case of a crafted web
application, can request authentication services from this module and
access to the CSRF token.");
  script_tag(name:"vuldetect", value:"This check tests the installed software version using the apt package manager.");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-deb.inc");

res = "";
report = "";
if ((res = isdpkgvuln(pkg:"ruby-omniauth", ver:"1.2.1-1+deb8u1", rls_regex:"DEB8.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}
if ((res = isdpkgvuln(pkg:"ruby-omniauth", ver:"1.3.1-1+deb9u1", rls_regex:"DEB9.[0-9]+", remove_arch:TRUE )) != NULL) {
    report += res;
}

if (report != "") {
  security_message(data:report);
} else if (__pkg_match) {
  exit(99); # Not vulnerable.
}
