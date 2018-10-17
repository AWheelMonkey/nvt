###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_CESA-2018_0517_autocorr-af_centos6.nasl 9135 2018-03-19 12:37:31Z asteins $
#
# CentOS Update for autocorr-af CESA-2018:0517 centos6 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH, http://www.greenbone.net
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
  script_oid("1.3.6.1.4.1.25623.1.0.882854");
  script_version("$Revision: 9135 $");
  script_tag(name:"last_modification", value:"$Date: 2018-03-19 13:37:31 +0100 (Mon, 19 Mar 2018) $");
  script_tag(name:"creation_date", value:"2018-03-15 08:46:38 +0100 (Thu, 15 Mar 2018)");
  script_cve_id("CVE-2018-6871");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");
  script_tag(name:"qod_type", value:"package");
  script_name("CentOS Update for autocorr-af CESA-2018:0517 centos6 ");
  script_tag(name: "summary", value: "Check the version of autocorr-af");
  script_tag(name: "vuldetect", value: "Get the installed version with the help 
of detect NVT and check if the version is vulnerable or not.");
  script_tag(name: "insight", value: "LibreOffice is an open source, 
community-developed office productivity suite. It includes key desktop 
applications, such as a word processor, a spreadsheet, a presentation manager, 
a formula editor, and a drawing program. LibreOffice replaces OpenOffice and 
provides a similar but enhanced and extended office suite.

Security Fix(es):

* libreoffice: Remote arbitrary file disclosure vulnerability via
WEBSERVICE formula (CVE-2018-6871)

For more details about the security issue(s), including the impact, a CVSS
score, and other related information, refer to the CVE page(s) listed in
the References section.
");
  script_tag(name: "affected", value: "autocorr-af on CentOS 6");
  script_tag(name: "solution", value: "Please Install the Updated Packages.");

  script_xref(name: "CESA", value: "2018:0517");
  script_xref(name: "URL" , value: "http://lists.centos.org/pipermail/centos-announce/2018-March/022802.html");
  script_tag(name:"solution_type", value:"VendorFix");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS6")
{

  if ((res = isrpmvuln(pkg:"autocorr-af", rpm:"autocorr-af~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-bg", rpm:"autocorr-bg~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-ca", rpm:"autocorr-ca~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-cs", rpm:"autocorr-cs~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-da", rpm:"autocorr-da~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-de", rpm:"autocorr-de~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-en", rpm:"autocorr-en~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-es", rpm:"autocorr-es~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-fa", rpm:"autocorr-fa~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-fi", rpm:"autocorr-fi~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-fr", rpm:"autocorr-fr~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-ga", rpm:"autocorr-ga~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-hr", rpm:"autocorr-hr~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-hu", rpm:"autocorr-hu~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-is", rpm:"autocorr-is~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-it", rpm:"autocorr-it~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-ja", rpm:"autocorr-ja~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-ko", rpm:"autocorr-ko~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-lb", rpm:"autocorr-lb~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-lt", rpm:"autocorr-lt~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-mn", rpm:"autocorr-mn~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-nl", rpm:"autocorr-nl~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-pl", rpm:"autocorr-pl~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-pt", rpm:"autocorr-pt~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-ro", rpm:"autocorr-ro~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-ru", rpm:"autocorr-ru~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-sk", rpm:"autocorr-sk~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-sl", rpm:"autocorr-sl~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-sr", rpm:"autocorr-sr~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-sv", rpm:"autocorr-sv~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-tr", rpm:"autocorr-tr~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-vi", rpm:"autocorr-vi~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"autocorr-zh", rpm:"autocorr-zh~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice", rpm:"libreoffice~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-base", rpm:"libreoffice-base~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-bsh", rpm:"libreoffice-bsh~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-calc", rpm:"libreoffice-calc~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-core", rpm:"libreoffice-core~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-draw", rpm:"libreoffice-draw~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-emailmerge", rpm:"libreoffice-emailmerge~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-filters", rpm:"libreoffice-filters~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-gdb-debug-support", rpm:"libreoffice-gdb-debug-support~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-glade", rpm:"libreoffice-glade~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-graphicfilter", rpm:"libreoffice-graphicfilter~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-headless", rpm:"libreoffice-headless~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-impress", rpm:"libreoffice-impress~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-af", rpm:"libreoffice-langpack-af~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ar", rpm:"libreoffice-langpack-ar~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-as", rpm:"libreoffice-langpack-as~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-bg", rpm:"libreoffice-langpack-bg~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-bn", rpm:"libreoffice-langpack-bn~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ca", rpm:"libreoffice-langpack-ca~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-cs", rpm:"libreoffice-langpack-cs~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-cy", rpm:"libreoffice-langpack-cy~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-da", rpm:"libreoffice-langpack-da~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-de", rpm:"libreoffice-langpack-de~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-dz", rpm:"libreoffice-langpack-dz~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-el", rpm:"libreoffice-langpack-el~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-en", rpm:"libreoffice-langpack-en~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-es", rpm:"libreoffice-langpack-es~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-et", rpm:"libreoffice-langpack-et~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-eu", rpm:"libreoffice-langpack-eu~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-fi", rpm:"libreoffice-langpack-fi~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-fr", rpm:"libreoffice-langpack-fr~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ga", rpm:"libreoffice-langpack-ga~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-gl", rpm:"libreoffice-langpack-gl~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-gu", rpm:"libreoffice-langpack-gu~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-he", rpm:"libreoffice-langpack-he~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-hi", rpm:"libreoffice-langpack-hi~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-hr", rpm:"libreoffice-langpack-hr~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-hu", rpm:"libreoffice-langpack-hu~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-it", rpm:"libreoffice-langpack-it~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ja", rpm:"libreoffice-langpack-ja~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-kn", rpm:"libreoffice-langpack-kn~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ko", rpm:"libreoffice-langpack-ko~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-lt", rpm:"libreoffice-langpack-lt~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-mai", rpm:"libreoffice-langpack-mai~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ml", rpm:"libreoffice-langpack-ml~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-mr", rpm:"libreoffice-langpack-mr~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ms", rpm:"libreoffice-langpack-ms~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-nb", rpm:"libreoffice-langpack-nb~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-nl", rpm:"libreoffice-langpack-nl~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-nn", rpm:"libreoffice-langpack-nn~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-nr", rpm:"libreoffice-langpack-nr~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-nso", rpm:"libreoffice-langpack-nso~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-or", rpm:"libreoffice-langpack-or~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-pa", rpm:"libreoffice-langpack-pa~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-pl", rpm:"libreoffice-langpack-pl~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-pt-BR", rpm:"libreoffice-langpack-pt-BR~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-pt-PT", rpm:"libreoffice-langpack-pt-PT~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ro", rpm:"libreoffice-langpack-ro~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ru", rpm:"libreoffice-langpack-ru~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-sk", rpm:"libreoffice-langpack-sk~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-sl", rpm:"libreoffice-langpack-sl~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-sr", rpm:"libreoffice-langpack-sr~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ss", rpm:"libreoffice-langpack-ss~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-st", rpm:"libreoffice-langpack-st~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-sv", rpm:"libreoffice-langpack-sv~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ta", rpm:"libreoffice-langpack-ta~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-te", rpm:"libreoffice-langpack-te~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-th", rpm:"libreoffice-langpack-th~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-tn", rpm:"libreoffice-langpack-tn~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-tr", rpm:"libreoffice-langpack-tr~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ts", rpm:"libreoffice-langpack-ts~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-uk", rpm:"libreoffice-langpack-uk~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ur", rpm:"libreoffice-langpack-ur~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-ve", rpm:"libreoffice-langpack-ve~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-xh", rpm:"libreoffice-langpack-xh~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-zh-Hans", rpm:"libreoffice-langpack-zh-Hans~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-zh-Hant", rpm:"libreoffice-langpack-zh-Hant~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-langpack-zu", rpm:"libreoffice-langpack-zu~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-librelogo", rpm:"libreoffice-librelogo~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-math", rpm:"libreoffice-math~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-nlpsolver", rpm:"libreoffice-nlpsolver~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-officebean", rpm:"libreoffice-officebean~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-ogltrans", rpm:"libreoffice-ogltrans~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-opensymbol-fonts", rpm:"libreoffice-opensymbol-fonts~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-pdfimport", rpm:"libreoffice-pdfimport~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-pyuno", rpm:"libreoffice-pyuno~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-rhino", rpm:"libreoffice-rhino~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-sdk", rpm:"libreoffice-sdk~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-sdk-doc", rpm:"libreoffice-sdk-doc~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-ure", rpm:"libreoffice-ure~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-wiki-publisher", rpm:"libreoffice-wiki-publisher~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-writer", rpm:"libreoffice-writer~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"libreoffice-xsltfilter", rpm:"libreoffice-xsltfilter~4.3.7.2~2.el6_9.2", rls:"CentOS6")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
