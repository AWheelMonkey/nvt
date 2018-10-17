###############################################################################
# OpenVAS Vulnerability Test
#
# CentOS Update for wireshark CESA-2013:0125 centos5 
#
# Authors:
# System Generated Check
#
# Copyright:
# Copyright (c) 2013 Greenbone Networks GmbH, http://www.greenbone.net
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

include("revisions-lib.inc");
tag_insight = "Wireshark, previously known as Ethereal, is a network protocol analyzer. It
  is used to capture and browse the traffic running on a computer network.

  A heap-based buffer overflow flaw was found in the way Wireshark handled
  Endace ERF (Extensible Record Format) capture files. If Wireshark opened a
  specially-crafted ERF capture file, it could crash or, possibly, execute
  arbitrary code as the user running Wireshark. (CVE-2011-4102)
  
  Several denial of service flaws were found in Wireshark. Wireshark could
  crash or stop responding if it read a malformed packet off a network, or
  opened a malicious dump file. (CVE-2011-1958, CVE-2011-1959, CVE-2011-2175,
  CVE-2011-2698, CVE-2012-0041, CVE-2012-0042, CVE-2012-0066, CVE-2012-0067,
  CVE-2012-4285, CVE-2012-4289, CVE-2012-4290, CVE-2012-4291)
  
  The CVE-2011-1958, CVE-2011-1959, CVE-2011-2175, and CVE-2011-4102 issues
  were discovered by Huzaifa Sidhpurwala of the Red Hat Security Response
  Team.
  
  This update also fixes the following bugs:
  
  * When Wireshark starts with the X11 protocol being tunneled through an SSH
  connection, it automatically prepares its capture filter to omit the SSH
  packets. If the SSH connection was to a link-local IPv6 address including
  an interface name (for example ssh -X [ipv6addr]%eth0), Wireshark parsed
  this address erroneously, constructed an incorrect capture filter and
  refused to capture packets. The &quot;Invalid capture filter&quot; message was
  displayed. With this update, parsing of link-local IPv6 addresses is fixed
  and Wireshark correctly prepares a capture filter to omit SSH packets over
  a link-local IPv6 connection. (BZ#438473)
  
  * Previously, Wireshark's column editing dialog malformed column names when
  they were selected. With this update, the dialog is fixed and no longer
  breaks column names. (BZ#493693)
  
  * Previously, TShark, the console packet analyzer, did not properly analyze
  the exit code of Dumpcap, Wireshark's packet capturing back end. As a
  result, TShark returned exit code 0 when Dumpcap failed to parse its
  command-line arguments. In this update, TShark correctly propagates the
  Dumpcap exit code and returns a non-zero exit code when Dumpcap fails.
  (BZ#580510)
  
  * Previously, the TShark &quot;-s&quot; (snapshot length) option worked only for a
  value greater than 68 bytes. If a lower value was specified, TShark
  captured just 68 bytes of incoming packets. With this update, the &quot;-s&quot;
  option is fixed and sizes lower than 68 bytes work as expected. (BZ#580513)
  
  This update also adds the following enhancement:
  
  * In ... 

  Description truncated, for more information please check the Reference URL";


tag_affected = "wireshark on CentOS 5";
tag_solution = "Please Install the Updated Packages.";



if(description)
{
  script_xref(name : "URL" , value : "http://lists.centos.org/pipermail/centos-announce/2013-January/019123.html");
  script_oid("1.3.6.1.4.1.25623.1.0.881567");
  script_version("$Revision: 9372 $");
  script_tag(name:"last_modification", value:"$Date: 2018-04-06 10:56:37 +0200 (Fri, 06 Apr 2018) $");
  script_tag(name:"creation_date", value:"2013-01-21 09:41:01 +0530 (Mon, 21 Jan 2013)");
  script_cve_id("CVE-2011-1958", "CVE-2011-1959", "CVE-2011-2175", "CVE-2011-2698",
                "CVE-2011-4102", "CVE-2012-0041", "CVE-2012-0042", "CVE-2012-0066",
                "CVE-2012-0067", "CVE-2012-4285", "CVE-2012-4289", "CVE-2012-4290",
                "CVE-2012-4291");
  script_tag(name:"cvss_base", value:"4.3");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:M/Au:N/C:N/I:N/A:P");
  script_xref(name: "CESA", value: "2013:0125");
  script_name("CentOS Update for wireshark CESA-2013:0125 centos5 ");

  script_tag(name:"summary", value:"Check for the Version of wireshark");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (c) 2013 Greenbone Networks GmbH");
  script_family("CentOS Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/centos", "ssh/login/rpms");
  script_tag(name : "affected" , value : tag_affected);
  script_tag(name : "solution" , value : tag_solution);
  script_tag(name : "insight" , value : tag_insight);
  script_tag(name:"qod_type", value:"package");
  script_tag(name:"solution_type", value:"VendorFix");
  exit(0);
}


include("pkg-lib-rpm.inc");

release = get_kb_item("ssh/login/release");

res = "";
if(release == NULL){
  exit(0);
}

if(release == "CentOS5")
{

  if ((res = isrpmvuln(pkg:"wireshark", rpm:"wireshark~1.0.15~5.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if ((res = isrpmvuln(pkg:"wireshark-gnome", rpm:"wireshark-gnome~1.0.15~5.el5", rls:"CentOS5")) != NULL)
  {
    security_message(data:res);
    exit(0);
  }

  if (__pkg_match) exit(99); # Not vulnerable.
  exit(0);
}
