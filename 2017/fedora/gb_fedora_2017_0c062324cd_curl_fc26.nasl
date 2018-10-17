###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_fedora_2017_0c062324cd_curl_fc26.nasl 8192 2017-12-20 09:53:28Z teissa $
#
# Fedora Update for curl FEDORA-2017-0c062324cd
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2017 Greenbone Networks GmbH, http://www.greenbone.net
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
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
  script_oid("1.3.6.1.4.1.25623.1.0.873888");
  script_version("$Revision: 8192 $");
  script_tag(name:"last_modification", value:"$Date: 2017-12-20 10:53:28 +0100 (Wed, 20 Dec 2017) $");
  script_tag(name:"creation_date", value:"2017-12-10 08:11:14 +0100 (Sun, 10 Dec 2017)");
  script_cve_id("CVE-2017-8816", "CVE-2017-8817");
  script_tag(name:"cvss_base", value:"7.5");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_tag(name:"qod_type", value:"package");
  script_name("Fedora Update for curl FEDORA-2017-0c062324cd");
  script_tag(name: "summary", value: "Check the version of curl");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "curl is a command line tool for transferring 
data with URL syntax, supporting FTP, FTPS, HTTP, HTTPS, SCP, SFTP, TFTP, TELNET, 
DICT, LDAP, LDAPS, FILE, IMAP, SMTP, POP3 and RTSP.  curl supports SSL certificates, 
HTTP POST, HTTP PUT, FTP uploading, HTTP form based upload, proxies, cookies, 
user+password authentication (Basic, Digest, NTLM, Negotiate, kerberos...), file 
transfer resume, proxy tunneling and a busload of other useful tricks.");
  script_tag(name: "affected", value: "curl on Fedora 26");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "FEDORA", value: "2017-0c062324cd");
  script_xref(name: "URL" , value: "https://lists.fedoraproject.org/archives/list/package-announce%40lists.fedoraproject.org/message/ZVHQBLZRBWKQK2BGDG3SQNPKXVJSDD3L");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2017 Greenbone Networks GmbH");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "FC26")
{

  if ((res = isrpmvuln(pkg:"curl", rpm:"curl~7.53.1~13.fc26", rls:"FC26")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
