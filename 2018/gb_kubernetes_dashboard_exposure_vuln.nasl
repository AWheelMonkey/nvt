###############################################################################
# OpenVAS Vulnerability Test
# $Id: gb_kubernetes_dashboard_exposure_vuln.nasl 11356 2018-09-12 10:46:43Z tpassfeld $
#
# Kubernetes Dashboard Public WAN (Internet) Accessible
#
# Authors:
# Thorsten Passfeld <thorsten.passfeld@greenbone.net>
#
# Copyright:
# Copyright (C) 2018 Greenbone Networks GmbH
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2
# (or any later version), as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
###############################################################################

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.114010");
  script_version("$Revision: 11356 $");
  script_tag(name:"last_modification", value:"$Date: 2018-09-12 12:46:43 +0200 (Wed, 12 Sep 2018) $");
  script_tag(name:"creation_date", value:"2018-07-20 09:10:47 +0200 (Fri, 20 Jul 2018)");
  script_tag(name:"cvss_base", value:"9.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:P/A:P");
  script_name("Kubernetes Dashboard Public WAN (Internet) Accessible");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2018 Greenbone Networks GmbH");
  script_family("Web application abuses");
  script_dependencies("global_settings.nasl", "gb_kubernetes_dashboard_detect.nasl");
  script_exclude_keys("keys/islocalhost", "keys/islocalnet", "keys/is_private_addr");
  script_mandatory_keys("kubernetes/dashboard/detected");

  script_xref(name:"URL", value:"https://info.lacework.com/hubfs/Containers%20At-Risk_%20A%20Review%20of%2021%2C000%20Cloud%20Environments.pdf");

  script_tag(name:"summary", value:"The script checks if the Kubernetes Dashboard UI is exposed to the public
  at the remote web server.");

  script_tag(name:"insight", value:"The installation of Kubernetes Dashboard might be incomplete and therefore
  it is unprotected and exposed to the public.");

  script_tag(name:"vuldetect", value:"Check if the Kubernetes Dashboard UI is accessible.");

  script_tag(name:"impact", value:"Access to the dashboard gives you top level
  access to all aspects of administration for the cluster it is assigned to manage.
  That includes managing applications, containers, starting workloads, adding and
  modifying applications, and setting key security controls.");

  script_tag(name:"solution", value:"It is highly recommended to consider the following:

  - Regardless of network policy, use MFA for all access.

  - Apply strict controls to network access, especially for UI and API ports.

  - Use SSL for all servers and use valid certificates with proper expiration and enforcement policies.

  - Investigate VPN (bastion), reverse proxy or direct connect connections to sensitive servers.

  - Look into product and services such as Lacework in order to discover, detect, prevent, and secure your container services.

  But most importantly:

  - Configure your Kubernetes pods to run read-only file systems.

  - Restrict privilege escalation in Kubernetes.

  - Build a pod security policy.");

  script_tag(name:"solution_type", value:"Mitigation");
  script_tag(name:"qod_type", value:"remote_banner");

  exit(0);
}

include("http_func.inc"); # For report_vuln_url()
include("network_func.inc");
include("host_details.inc");

if(islocalnet() || islocalhost() || is_private_addr()) exit(0);

CPE = "cpe:/a:kubernetes:dashboard";

if(!port = get_app_port(cpe: CPE)) exit(0);

if(get_kb_item("kubernetes/dashboard/" + port + "/detected") ) {
  report = "Kubernetes Dashboard UI is exposed to the public under the following URL: " + report_vuln_url(port: port, url: "/", url_only: TRUE);
  get_app_location(cpe: CPE, port: port, nofork: TRUE);
  security_message(port: port, data: report);
  exit(0);
}

exit(99);
